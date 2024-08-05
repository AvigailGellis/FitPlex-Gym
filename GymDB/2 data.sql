use GymDB
go 
delete Member 
go

insert member(FirstName, LastName, ContactNumber, EmergencyContactNumber, InitialWeight, GoalWeight, CurrentWeight, BMI, MembershipStartDate, MembershipEndDate, MembershipType, PaymentStatus, SessionDate, SessionTime)
select 'Dorothy', 'Dow', '540-1236', '540-7890', 180, 150, 165, 28.0, '2024-04-01', '2024-07-01', 'Semi-annual', 1, '2024-07-01', '09:00'
union select 'John', 'Smith', '540-9338', '540-6543', 230, 180, 180, 26.9, '2022-12-24', '2023-02-24', 'Annual', 1, '2023-02-24', '15:00'
union select 'Elsy', 'Johnson', '826-6940', '826-4321', 130, 120, 125, 28.2, '2024-07-15', '2024-08-15', 'Monthly', 0, '2024-07-30', '10:15'
union select 'Alice', 'McCormick', '362-3286', '362-1111', 150, 110, 120, 27.6, '2023-09-15', '2024-09-15', 'Annual', 1, '2024-07-28', '13:30'