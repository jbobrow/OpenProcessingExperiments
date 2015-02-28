
int[] headcount = {4599, 8297, 8863, 26680, 28786, 32398, 31556, 30112};
string[] inst = {"Snow","SUU", "Dixie", "Weber", "USU", "U of U", "UVU", "SLCC"};
int r = 1;
int c = 1;
size(600, 500);
background(0);
stroke(200);
textAlign(CENTER);
rectMode(CENTER);

for (int i=0; i<headcount.length; i++) {
   stroke(200,150);
   fill(random(100),random(100),random(100),100);
   c=25+random(width-50);
   r=50+random(height-75);
   rect (c,r,sqrt(headcount[i]/2),sqrt(headcount[i]/2));
   //ellipse (c,r,sqrt(headcount[i]/2),sqrt(headcount[i]/2));
   fill(255);
   text(inst[i],c,r-8);
   text(nfc(headcount[i]),c,r+8);

}
fill(255);
text("Relative headcounts for USHE institutions (Fall 2012)",width/2,15);
