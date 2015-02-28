
size(250,250);
smooth();
background (0);
fill (#4E0889,50);
noStroke();
for (int i=0; i<250; i+=35){
    bezier(100,34,i/2.0,i-10.0,23,0,40,i);
    bezier(0,230,12,i/6.0,50,12,i,80);
    bezier(30,20,i,i/6.0,100,250,180,i-90);
    bezier(40,i/5.0,80,100,i,i/2.0,30,0);
    bezier(100,10,90,i/2.0,25,i,30,i);
    bezier(30,i,200,i/2.0,10,20,i/3.0,0);
    bezier(60,30,i-30.0,i/5.0,i,30,100,i);
    bezier(250,180,150,i,i/5.0,240,210,i/2.0);
    bezier(260,260,250,i,i,250,240,260); //purple curves
 }
         
       
  PFont font; 
font = loadFont("Serif-90.vlw");
textFont(font);

for(int x=5; x < 190; x += 30){
  fill(0,100);
text("9",x,100);
text("2",x,180);
text("7",x,235);
text("M", x,70);

text("M",x,150);

text("G",x,210); //type   
       
       
         }



