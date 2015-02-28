
float[] disney = {55, 50, 70, 70, 45, 50, 80, 70, 40, 35, 65, 95};
char mon []  = {'J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'};
color [] dis = {#06097C, #F5ED00, #EAEAE8};
float x;
int y = 75;

  size(600, 150);
  background(dis[0]);
  smooth();
  noStroke();
  textAlign(CENTER);
  fill(dis[1]);
  text("Disneyland Attendance by Month", width/2, 30);
  textSize(9);
  text("Source: http://www.disneylandvacationtips.com/disneyland-attendance.html", width/2, 145);

for (int i = 0; i<disney.length; i++){
x=25+(width/12)*i;
fill(dis[2], int((disney[i]/100)*255));
//fill(#EAEAE8, 95);
ellipse(x, y, 50, 50);
fill(dis[1]);
textAlign(RIGHT);
text(mon[i], x, 120);
}
