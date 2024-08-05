--1) I would like a list of all active members with their membership details. I would like each member to be listed as last name, 	first initial.
select Member = concat(m.LastName, ', ', substring(FirstName,1,1)), MembershipStartDate, MembershipEndDate, MembershipType
from Member m 
where m.MembershipStartDate <= getdate() and m.MembershipEndDate >= getdate()
--2) I want a list of all active members whose memberships are due to expire within the next month so that I can text them a 	reminder to renew their subscription.
select *
from Member m 
where m.MembershipEndDate between getdate() and dateadd(month, 1, getdate())
--3) I want to collect payments that are past due, but would first like to see how much I am owed. Please provide a count of all 	members per membership type and show how many paid and how many did not. 
select NumberOfMembers = count(*), 'Paid/NotPaid' = case when m.PaymentStatus = 0 then 'Not Paid' else 'Paid' end, m.MembershipType
from Member m 
group by m.PaymentStatus, m.MembershipType
--4) I would like to check in on the overall effectiveness of our gym's weight loss program. Please provide a list of all members 	and their progress, sorted by the amount of weight loss in desc order. 
select m.FirstName, m.LastName, m.WeightLoss
from Member m 
order by WeightLoss desc
--5) I would like to see the difference in progress made by members in different membership categories. Please show me the average 	weight loss per membership type.
select AvgWeightLoss = avg(m.WeightLoss), m.MembershipType
from Member m 
group by m.MembershipType