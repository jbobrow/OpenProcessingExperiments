
//dana gloria 
//midterm 2
//www.disastercenter.com/crime 

PImage b;

int data[] = {6,7,8,10,13,21,23,24,24,26,29,31,39,48,53,54,62,91,96,100,120,130,138,142,152,155,158,187,195,208,210,273,292,357,369,371,409,420,430,476,476,510,558,567,657,706,866,987,1249,1809 };
 void setup () {
 smooth(); 
 strokeWeight(3);
 strokeCap(ROUND);  //processing.org Stroke Cap/Stroke Weight
line(20, 40, 80, 40);
 
  b = loadImage ("hor.jpg");
   size(1725,800); 
   
 }
 void draw() {
 background(0);
	
// Move the mouse left and right across the image
// to see the cursor change from a cross to a hand

  if(mouseX < 500) {
    cursor(HAND);
  } else {
    cursor(CROSS);}
  


PImage b; 
b=loadImage ("hor.jpg");  
   image (b,0,0); 

for(int i = 0; i < data.length; i++) {   
     
    float lineSize = map(data[i], 5,1820,0,0);
    stroke(255);
    smooth();
    
        line(i*35 ,580,lineSize,lineSize);
        
         
         
    PFont font; 

font = loadFont ("vtk.vlw"); 
textFont(font,13); 
fill(124,4,4); 
text(data[i], i*34+3 , 600);

font= loadFont ("Nec.vlw");
textFont(font,16);
fill(147,141,141); 

text ("SC",5,650); 

text ("VT",30,625);

text ("WY",65,650);

text ("ND",100,625);

text ("NH",135,650);

text ("ID",175,625);

text ("SD",205,650);

text ("HI",240,625);

text ("ME",272,650);

text ("MT",305,625);

text ("RI",345,650);

text ("AK",375,625);

text ("IA",410,650);

text ("DE",445,625);

text ("UT",480,650);

text ("NE",510,625);

text ("WV",545,650);

text ("OR",580,625);

text ("MN",610,650);

text ("KS",650,625);

text ("CO",685,650);

text ("CT",720,625);

text ("AR",755,650);

text ("NM",785,625);

text ("WA",825,650);

text ("WI",855,625);

text ("NV",890,650);

text ("KY",925,625);

text ("OK",960,650);

text ("MS",990,625);

text ("MA",1025,650);

text ("AL",1060,625);

text ("IN",1095,650);

text ("TN",1128,625);

text ("VA",1165,650);

text ("NJ",1195,625);

text ("AZ",1230,650);

text ("MO",1265,625);

text ("MD",1300,650);

text ("OH",1335,625);

text ("NC",1375,650);

text ("LA",1405,625);

text ("GA",1435,650);

text ("MI",1470,625);

text ("PN",1500,650);



textFont(font,18);
fill(255);
text ("IL",1540,625);

text ("NY",1570,650);

text ("FL",1605,625);

text ("TX",1640,650);

text ("CA",1680,625);


font = loadFont("Cen.vlw");
textFont(font,14); 
fill(118,115,115);
 text("www.disastercenter.com/crime", 1480, 700);


font = loadFont("Sol.vlw");
textFont(font,75); 
fill(124,4,4);
text ("2010 U.S. Murder Rates", 800,200); 
   


}
  }


