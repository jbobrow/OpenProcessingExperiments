
/* to calculate a time difference, just do
* timeToSeconds(year1,month1,day1,hour1,minute1,second1)-timeToSeconds(year2,month2,day2,hour2,minute2,second2)
*/
int [] daysOfYear={0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335};
int [] daysOfLeapYear={0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335};
void setup(){
  size(300,300);
  background(255);
  smooth(8);
  fill(0);
}
void draw(){
  background(255);
  String timetext="Since year 0, 1st of january, 0h0mn0s\n\n";
  int years=year();
  timetext+=str(years)+" years\n";
  int days=years * 365 +(years % 4) -(years% 100) +(years% 400)+dayOfYear(((years % 4) -(years% 100) +(years% 400)==1),month(),day());
  timetext+=str(days)+" days\n";
  int hours=days*24+hour();
  timetext+=str(hours)+" hours\n";
  int minutes=hours*60+minute();
  timetext+=str(minutes)+" minutes\n";
  double secondes=minutes*60+second();
  timetext+=str(secondes)+" secondes elapsed!\nand ";
  timetext+=str(HMSToSeconds(hour(),minute(),second()))+" seconds since this day began!\n";
  timetext+=str(timeToSeconds(3001,1,1,0,0,0)-secondes)+" seconds until next millenaire!\n";
  text(timetext,20,50);
  
}
double timeToSeconds(int _year,int _month,int _day,int _hour,int _minute,int _second){
  double sec =(_year * 365 +(_year % 4) -(_year% 100) +(_year% 400)+dayOfYear(((_year % 4) -(_year% 100) +(_year% 400)==1),_month,_day))
  * 24*3600 +_hour * 3600 +_minute * 60 +_second;
  return sec;
}
double HMSToSeconds(int _hour,int _minute,int _second){
  double sec =_hour * 3600 +_minute * 60 +_second;
  return sec;
}
int dayOfYear (boolean isLeapYear, int _month,int _day){
    int dayYear=0;
    if (isLeapYear)dayYear=daysOfLeapYear[_month] + _day;
    else dayYear=daysOfYear[_month] + _day;
    return dayYear;
}


