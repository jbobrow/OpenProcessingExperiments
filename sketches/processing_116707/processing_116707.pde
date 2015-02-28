
void setup(){


  size(900,450);
background(142,142,142);

fill(225,0,0);



}
void draw(){


 String q="One";
   int hour =hour();
  if (hour>12){
     hour=(hour-12);}
     
 String q2="Two";
 int min1 =(minute()/10);
 
 String q3="Three";
 int min2=(minute()%10);{
    q2="Ten thousand derpy drivers...";}
 if (minute()==11){
 q2="eleven-year olds, but the company knows that @katyperry appeals to kids";}
 if (minute()==12){
 q2="twelve years I have been missing the meat in the middle ...";}
 if(minute()==13){
   q2="thirteen minutes and I've already gotten 23 kisses from her #YesICounted ";}
   if (minute()==14){
     q2="fourteen year old girls in the front row";}
     if (minute()==15){
       q2=" fifteen minutes wasted #keepitup";}
       if (minute()==16){
         q2="Sixteen in the middle of Miami.";}
         if (minute()==17){
           q2="seventeen year old self on fire too";}
           if (minute()==18){
             q2="eighteen I know too much";}
             if (minute()==19){
               q2="nineteen and you like my little pony";}
 
 if (hour==1){
   q="one of Mario Lopez's dimples.";}
 if (hour==2){
   q="Two Mexicans playing basketball call it Juan on Juan.";}
   if (hour==3){
   q="three cups of coffee a day can shrink a woman's breasts";}
   if (hour==4){
   q="FOUR YEAR OLD IS PRETTIER THAN ME. THIS IS WHY I HAVE LOW SELF-ESTEEM";}
 if(hour==5){
   q="Five biblical practices the church can learn from Chick-fil-A.";}
 if(hour==6){
   q="six pack is protected by a layer of fat.";}
 if(hour==7){
   q="seven billion people in this world; find someone else.";}
 if (hour==8){
   q="EIGHT IN THE MORNING. Anyone good at sniping? Will pay in Trident layers.";}
 if (hour==9){
 q="nine months time there will be births";}
 if (hour==10){
 q="ten pounds of jawbreakers. It ain't nothin' sexual.";}
 if (hour==11){
 q="eleven pm. Out there be monsters. Or women. I'm scared.";}
 if(hour==12){
 q="twelve I went to hell for snuffing Jesus.";}
 if (hour==0){
   q="twelve, there's no in-between.";}

 textSize(18);
text(q,200,260);
 
 if (min1==0){
   if(min2==0){
   q2="oh lol you tweeting like you ain't .";
   q3="";}
   else{
      q2="oh lol you tweeting like you ain't .";}}
   if(min1==1){
  q3="";}
   if (min1==2){
   q2="twenty minutes ago. Since then, I've found myself in bed.";} 
 if (min1==3){
   q2="thirty minutes and I've already gotten 23 kisses from her #YesIC";}
  if (min1==4){
   q2="forty miles no im tire and i cant please lord";}
   if (min1==5){
   q2="Fifty shades of fucking hungry.";} 

 textSize(18);
text(q2,200,300);

if (min2==0){
   q3="";}
if (min2==1){
  if(min1==1){
     q3="";}
     else{
   q3="one direction does not make u jump off the cliff and dive into a pool of sharks";}}
 if (min2==2){
   if(min1==1){
     q3="";}
     else{
   q3="TWO extra pudding cups tonight.";}}
   if (min2==3){
     if(min1==1){
     q3="";}
     else{
   q3="three guys playing hackie sack and smoking at the same time. Should I be impressed or worried?";}}
   if (min2==4){
     if(min1==1){
     q3="";}
     else{
   q3="four women in design speak candidly about careers and motherhood.";}}
 if(min2==5){
   if(min1==1){
     q3="";}
     else{
   q3="five bananas are not eaten, and one in ten end up in the bin.";}}
 if(min2==6){
   if(min1==1){
     q3="";}
     else{
   q3="six years old, we waited in cold for you and the Secret Service said No.@BarackObama";}}
 if(min2==7){
   if(min1==1){
     q3="";}
     else{
   q3="seven B's : Books before boys because boys bring babies";}}
 if (min2==8){
   if(min1==1){
     q3="";}
     else{
   q3="eight bitches at once.";}}
 if (min2==9){
   if(min1==1){
     q3="";}
     else{
 q3="nine am, please shower me with praise";}}

 textSize(18);
text(q3,200,340);

fill(225);
textSize(24);
text("time in twitter-verse", 200, 150);
}


