use GymDB 
go 

drop table if exists Member 
go

create table dbo.Member(
    MemberId int not null identity primary key,
    FirstName varchar(50) not null constraint ck_Member_FirstName_cannot_be_blank check(FirstName <> ''),
    LastName varchar(50) not null constraint ck_Member_LastName_cannot_be_blank check(LastName <> ''),
    ContactNumber varchar(8) not null constraint ck_Member_ContactNumber_must_be_3_numbers_a_dash_then_4_numbers check(ContactNumber like '[0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'),
    EmergencyContactNumber varchar(8) not null constraint ck_Member_EmergencyContactNumber_must_be_3_numbers_a_dash_then_4_numbers check(EmergencyContactNumber like '[0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'),
    InitialWeight int not null constraint ck_Member_InitialWeight_must_be_greater_than_zero check(InitialWeight > 0),
    GoalWeight int not null constraint ck_Member_GoalWeight_must_be_greater_than_zero check(GoalWeight > 0),
    CurrentWeight int not null constraint ck_Member_CurrentWeight_must_be_greater_than_zero check(CurrentWeight > 0),
    BMI decimal(4, 1) not null constraint ck_Member_BMI_must_be_greater_than_zero check(BMI > 0),
    MembershipStartDate date not null constraint ck_Member_MembershipStartDate_must_be_after_december_1st_2022 check(MembershipStartDate >= '2022-12-01'),
    MembershipEndDate date not null,
    MembershipType varchar(20) not null constraint ck_Member_MembershipType_must_be_either_annual_semiannual_monthly_or_quarterly check(MembershipType in ('Annual', 'Semi-annual', 'Monthly', 'Quarterly')),
    PaymentStatus bit not null,
    SessionDateAndTime datetime not null,
    constraint ck_Member_MembershipStartDate_is_before_MembershipEndDate check(MembershipStartDate < MembershipEndDate)
)
go