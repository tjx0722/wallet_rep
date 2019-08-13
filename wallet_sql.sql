/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/8/13 19:30:44                           */
/*==============================================================*/


drop table if exists bankcard;

drop table if exists certification;

drop table if exists contact;

drop table if exists debtinvest;

drop table if exists debttransferapply;

drop table if exists debttransferdisplay;

drop table if exists invest;

drop table if exists loanapply;

drop table if exists loandisplay;

drop table if exists loanrate;

drop table if exists loantime;

drop table if exists recharge_withdraw;

drop table if exists repay;

drop table if exists role;

drop table if exists roletree;

drop table if exists servicecharge;

drop table if exists systemlog;

drop table if exists transactionlog;

drop table if exists transactiontype;

drop table if exists tree;

drop table if exists user;

drop table if exists userinfo;

drop table if exists userrole;

drop table if exists wallet;

/*==============================================================*/
/* Table: bankcard                                              */
/*==============================================================*/
create table bankcard
(
   bankcardid           int not null auto_increment,
   bankcardnum          varchar(20) not null,
   bankcardname         varchar(20) not null,
   walletid             int not null,
   primary key (bankcardid)
);

/*==============================================================*/
/* Table: certification                                         */
/*==============================================================*/
create table certification
(
   certificationid      int not null auto_increment,
   idcardnum            char(20) not null,
   idcardimgfront       varchar(200) not null,
   idcardimgback        varchar(200) not null,
   idcardimghand        varchar(200) not null,
   userinfoid           int not null,
   primary key (certificationid)
);

/*==============================================================*/
/* Table: contact                                               */
/*==============================================================*/
create table contact
(
   contactid            int not null auto_increment,
   contactname          varchar(20) not null,
   contactphone         char(20) not null,
   relationship         varchar(20) not null,
   userinfoid           int not null,
   primary key (contactid)
);

/*==============================================================*/
/* Table: debtinvest                                            */
/*==============================================================*/
create table debtinvest
(
   debtinvestid         int not null auto_increment,
   userinfoid           int not null,
   investamount         double not null,
   paytime              datetime not null,
   istransfer           bool not null default false,
   servicecharge        double not null,
   servicechargeid      int not null,
   debttransferdisplay  int not null,
   primary key (debtinvestid)
);

/*==============================================================*/
/* Table: debttransferapply                                     */
/*==============================================================*/
create table debttransferapply
(
   debttransferapplyid  int not null auto_increment,
   userinfoid           int not null,
   investid             int not null,
   applytime            datetime not null,
   checked              bool not null default false,
   servicecharge        double not null,
   servicechargeid      int not null,
   primary key (debttransferapplyid)
);

/*==============================================================*/
/* Table: debttransferdisplay                                   */
/*==============================================================*/
create table debttransferdisplay
(
   debttransferdisplay  int not null auto_increment,
   displaytime          datetime not null,
   deadtime             datetime not null,
   isfinished           bool not null default false,
   isdead               bool not null default false,
   debttransferapplyid  int not null,
   primary key (debttransferdisplay)
);

/*==============================================================*/
/* Table: invest                                                */
/*==============================================================*/
create table invest
(
   investid             int not null auto_increment,
   userinfoid           int not null,
   investamount         double not null,
   paytime              datetime not null,
   loandisplayid        int not null,
   istransfer           bool not null default false,
   servicecharge        double not null,
   servicechargeid      int not null,
   primary key (investid)
);

/*==============================================================*/
/* Table: loanapply                                             */
/*==============================================================*/
create table loanapply
(
   loanapplyid          int not null auto_increment,
   userinfoid           int not null,
   loanamount           double not null,
   applytime            datetime not null,
   reason               text not null,
   checked              bool not null default false,
   loantimeid           int not null,
   loanrateid           int not null,
   servicecharge        double not null,
   servicechargeid      int not null,
   primary key (loanapplyid)
);

/*==============================================================*/
/* Table: loandisplay                                           */
/*==============================================================*/
create table loandisplay
(
   loandisplayid        int not null auto_increment,
   displaytime          datetime not null,
   deadtime             datetime not null,
   isfinished           bool not null default false,
   isdead               bool not null default false,
   loanapplyid          int not null,
   primary key (loandisplayid)
);

/*==============================================================*/
/* Table: loanrate                                              */
/*==============================================================*/
create table loanrate
(
   loanrateid           int not null auto_increment,
   loanrate             double not null,
   primary key (loanrateid)
);

/*==============================================================*/
/* Table: loantime                                              */
/*==============================================================*/
create table loantime
(
   loantimeid           int not null auto_increment,
   loantime             datetime not null,
   primary key (loantimeid)
);

/*==============================================================*/
/* Table: recharge_withdraw                                     */
/*==============================================================*/
create table recharge_withdraw
(
   recharge_withdraw_id int not null auto_increment,
   userinfoid           int not null,
   recharge_withdraw_amount double not null,
   recharge_withdraw_time datetime not null,
   servicecharge        double not null,
   servicechargeid      int not null,
   transactionserialnum bigint not null,
   transactiontypeid    int not null,
   primary key (recharge_withdraw_id)
);

/*==============================================================*/
/* Table: repay                                                 */
/*==============================================================*/
create table repay
(
   repayid              int not null auto_increment,
   loanapplyid          int not null,
   userinfoid           int not null,
   restamount           double not null,
   isfinished           bool not null default false,
   repaytime            datetime not null,
   actualrepaytime      datetime not null,
   isovertime           bool not null default false,
   primary key (repayid)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   roleid               int not null auto_increment,
   rolename             varchar(20) not null,
   primary key (roleid)
);

/*==============================================================*/
/* Table: roletree                                              */
/*==============================================================*/
create table roletree
(
   roleid               int not null,
   treeid               int not null,
   primary key (roleid, treeid)
);

/*==============================================================*/
/* Table: servicecharge                                         */
/*==============================================================*/
create table servicecharge
(
   servicechargeid      int not null auto_increment,
   servicetype          varchar(20) not null,
   chargerate           double not null,
   primary key (servicechargeid)
);

/*==============================================================*/
/* Table: systemlog                                             */
/*==============================================================*/
create table systemlog
(
   systemlogid          int not null auto_increment,
   url                  varchar(50) not null,
   userid               int not null,
   time                 datetime not null,
   primary key (systemlogid)
);

/*==============================================================*/
/* Table: transactionlog                                        */
/*==============================================================*/
create table transactionlog
(
   transactionlog       int not null auto_increment,
   userinfoid           int not null,
   time                 datetime not null,
   amount               double not null,
   servicetype          varchar(20) not null,
   primarykey           varchar(50) not null,
   primary key (transactionlog)
);

/*==============================================================*/
/* Table: transactiontype                                       */
/*==============================================================*/
create table transactiontype
(
   transactiontypeid    int not null auto_increment,
   transactiontypename  varchar(20) not null,
   url                  varchar(200) not null,
   primary key (transactiontypeid)
);

/*==============================================================*/
/* Table: tree                                                  */
/*==============================================================*/
create table tree
(
   treeid               int not null auto_increment,
   treename             varchar(20) not null,
   file                 varchar(50),
   icon                 varchar(200),
   parentid             int not null,
   primary key (treeid)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   userid               int not null auto_increment,
   account              varchar(20) not null,
   password             varchar(20) not null,
   phone                char(11) not null,
   email                varchar(20) not null,
   isdelete             bool not null default false,
   primary key (userid)
);

/*==============================================================*/
/* Table: userinfo                                              */
/*==============================================================*/
create table userinfo
(
   userinfoid           int not null auto_increment,
   userid               int,
   username             varchar(20) not null,
   currentaddress       varchar(50) not null,
   nativeplace          varchar(50) not null,
   usericon             varchar(200),
   nickname             varchar(20),
   userjob              varchar(20) not null,
   degree               varchar(20) not null,
   birthday             date not null,
   sex                  bool default true,
   salary               int,
   ismarried            bool default false,
   infochecked          bool not null default false,
   primary key (userinfoid)
);

/*==============================================================*/
/* Table: userrole                                              */
/*==============================================================*/
create table userrole
(
   userid               int not null,
   roleid               int not null,
   primary key (userid, roleid)
);

/*==============================================================*/
/* Table: wallet                                                */
/*==============================================================*/
create table wallet
(
   walletid             int not null auto_increment,
   balance              double not null,
   debt                 double not null,
   userinfoid           int not null,
   primary key (walletid)
);

alter table bankcard add constraint FK_Reference_6 foreign key (walletid)
      references wallet (walletid) on delete restrict on update restrict;

alter table certification add constraint FK_Reference_3 foreign key (userinfoid)
      references userinfo (userinfoid) on delete restrict on update restrict;

alter table contact add constraint FK_Reference_4 foreign key (userinfoid)
      references userinfo (userinfoid) on delete restrict on update restrict;

alter table debtinvest add constraint FK_Reference_22 foreign key (userinfoid)
      references userinfo (userinfoid) on delete restrict on update restrict;

alter table debtinvest add constraint FK_Reference_23 foreign key (servicechargeid)
      references servicecharge (servicechargeid) on delete restrict on update restrict;

alter table debtinvest add constraint FK_Reference_30 foreign key (debttransferdisplay)
      references debttransferdisplay (debttransferdisplay) on delete restrict on update restrict;

alter table debttransferapply add constraint FK_Reference_18 foreign key (servicechargeid)
      references servicecharge (servicechargeid) on delete restrict on update restrict;

alter table debttransferapply add constraint FK_Reference_20 foreign key (userinfoid)
      references userinfo (userinfoid) on delete restrict on update restrict;

alter table debttransferapply add constraint FK_Reference_31 foreign key (investid)
      references invest (investid) on delete restrict on update restrict;

alter table debttransferdisplay add constraint FK_Reference_21 foreign key (debttransferapplyid)
      references debttransferapply (debttransferapplyid) on delete restrict on update restrict;

alter table invest add constraint FK_Reference_17 foreign key (servicechargeid)
      references servicecharge (servicechargeid) on delete restrict on update restrict;

alter table invest add constraint FK_Reference_19 foreign key (userinfoid)
      references userinfo (userinfoid) on delete restrict on update restrict;

alter table invest add constraint FK_Reference_29 foreign key (loandisplayid)
      references loandisplay (loandisplayid) on delete restrict on update restrict;

alter table loanapply add constraint FK_Reference_12 foreign key (loantimeid)
      references loantime (loantimeid) on delete restrict on update restrict;

alter table loanapply add constraint FK_Reference_13 foreign key (loanrateid)
      references loanrate (loanrateid) on delete restrict on update restrict;

alter table loanapply add constraint FK_Reference_14 foreign key (servicechargeid)
      references servicecharge (servicechargeid) on delete restrict on update restrict;

alter table loanapply add constraint FK_Reference_15 foreign key (userinfoid)
      references userinfo (userinfoid) on delete restrict on update restrict;

alter table loandisplay add constraint FK_Reference_11 foreign key (loanapplyid)
      references loanapply (loanapplyid) on delete restrict on update restrict;

alter table recharge_withdraw add constraint FK_Reference_24 foreign key (userinfoid)
      references userinfo (userinfoid) on delete restrict on update restrict;

alter table recharge_withdraw add constraint FK_Reference_25 foreign key (servicechargeid)
      references servicecharge (servicechargeid) on delete restrict on update restrict;

alter table recharge_withdraw add constraint FK_Reference_26 foreign key (transactiontypeid)
      references transactiontype (transactiontypeid) on delete restrict on update restrict;

alter table repay add constraint FK_Reference_16 foreign key (loanapplyid)
      references loanapply (loanapplyid) on delete restrict on update restrict;

alter table roletree add constraint FK_Reference_10 foreign key (roleid)
      references role (roleid) on delete restrict on update restrict;

alter table roletree add constraint FK_Reference_9 foreign key (treeid)
      references tree (treeid) on delete restrict on update restrict;

alter table transactionlog add constraint FK_Reference_27 foreign key (userinfoid)
      references userinfo (userinfoid) on delete restrict on update restrict;

alter table userinfo add constraint FK_Reference_28 foreign key (userid)
      references user (userid) on delete restrict on update restrict;

alter table userrole add constraint FK_Reference_7 foreign key (userid)
      references user (userid) on delete restrict on update restrict;

alter table userrole add constraint FK_Reference_8 foreign key (roleid)
      references role (roleid) on delete restrict on update restrict;

alter table wallet add constraint FK_Reference_5 foreign key (userinfoid)
      references userinfo (userinfoid) on delete restrict on update restrict;

