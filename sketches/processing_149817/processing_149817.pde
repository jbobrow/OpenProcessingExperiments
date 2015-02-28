
int[] headcount2000 = {3407, 5603, 6071, 15107, 19281, 24747, 18150, 21294};
int[] headcount2013 = {4605, 7745, 8350, 25301, 27812, 32080, 30564, 31137};
string[] inst = {"Snow","SUU", "Dixie", "Weber", "USU", "U of U", "UVU", "SLCC"};
int r = 1;
int c = 1;
size(550, 600);
background(0);
stroke(200);
textAlign(CENTER);
rectMode(CENTER);

for (int i=0; i<headcount2013.length; i++) {
   c=100+random(width-200);
   r=100+random(height-200);
   fill(0,100);
   stroke(200,100);
   rect (c,r,sqrt(headcount2000[i]/2),sqrt(headcount2000[i]/2));
   fill(random(100),random(100),random(100),50);
   stroke(200,150);
   rect (c,r,sqrt(headcount2013[i]/2),sqrt(headcount2013[i]/2));
   
   fill(255);
   text(inst[i],c,r-16);
   text(nfc(headcount2013[i]),c,r);
   fill(120);
   text(nfc(headcount2000[i]),c,r+16);

}
fill(255);
text("Relative headcounts for USHE institutions (Fall 2000, 2013)",width/2,15);
