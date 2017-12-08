using FinancialToolbox
using Base.Test

function yearFractionTester(StartDate,EndDate,MatlabResults,TestToll=1e-14)
for i=0:FinancialToolbox.currMaxImplemented
	@test(abs(MatlabResults[i+1]-yearfrac(StartDate,EndDate,i))<TestToll)
end
return ;
end


StartDate=Date(1992,12,14);
EndDate=Date(1996,2,28);
MatlabResults=[3.20821917808219;3.20555555555556;3.25277777777778;3.20821917808219;3.20555555555556;3.20555555555556;3.20555555555556;3.20821917808219;3.20821917808219;3.25277777777778;3.20821917808219;3.20555555555556;3.20765027322409];
yearFractionTester(StartDate,EndDate,MatlabResults);

EndDate2=Date(1996,2,29);
MatlabResults2=[3.21095890410959;3.20833333333333;3.25555555555556;3.21095890410959;3.20833333333333;3.20833333333333;3.20833333333333;3.21095890410959;3.21095890410959;3.25555555555556;3.21095890410959;3.20833333333333;3.21038251366122];
yearFractionTester(StartDate,EndDate2,MatlabResults2);



EndDate3=Date(2026,2,28);
MatlabResults3=[33.2301369863014;33.2055555555556;33.6916666666667;33.2301369863014;33.2055555555556;33.2055555555556;33.2055555555556;33.2082191780822;33.2301369863014;33.6916666666667;33.2301369863014;33.2055555555556;33.2080844374580];
TestToll=1e-13;
yearFractionTester(StartDate,EndDate3,MatlabResults3,TestToll);

@test_throws(ErrorException,yearfrac(StartDate,EndDate3,FinancialToolbox.currMaxImplemented+1));

@test(daysact(Date(1992,12,14),Date(1992,12,13))==-1)

println("Test Dates Passed")
