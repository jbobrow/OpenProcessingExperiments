
int monsterX;
int monsterY;
int richting;
int teller;
boolean test;
int y;  
int spatie; 
int stop; 



void setup (){
size (200,200);
monsterX= 80;
monsterY= 140;
richting = 3;
teller = 0;
test = false;
y = 0;
spatie = 20;
stop = 500;
}

void draw () { 
  background (255);

  noStroke();
 
streepjes();
monster();
moving();
}

void streepjes(){ 
while(y < stop){
   println("test");
   noStroke();
   fill(175,14,14);
   rect(0,y,400,10);
   y = y + spatie;
}
y=0;
}

void monster(){
//oorschelp links
 if( test == true){
   fill(209,209,209);
 }
 else {
   fill (90,45,7);
 }
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX-40,monsterY-45,35,35);

fill (209,150,0); // oor links
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX-40,monsterY-45,25,25);

//oorschelp rechts
 if( test == true){
   fill(209,209,209);
 }
 else {
   fill (90,45,7);
 }
ellipseMode(CENTER);
stroke(0);
ellipse( mouseX+40,monsterY-45,35,35);

fill (209,150,0); // oor rechts
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX+40,monsterY-45,25,25);

//body
 if( test == true){
   fill(232,232,232);
 }
 else {
   fill (116,56,7);
 }
ellipseMode(CENTER);
stroke(0);
ellipse( mouseX,monsterY,100,100); //x80 y140

//arm links
 if( test == true){
   fill(209,209,209);
 }
 else {
   fill (90,45,7);
 }
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX-50,monsterY-10,20,20);

//arm rechts
 if( test == true){
   fill(209,209,209);
 }
 else {
   fill (90,45,7);
 }
ellipseMode(CENTER);
stroke(0);
ellipse( mouseX+50,monsterY-10,20,20);

fill (0); //neus
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX,monsterY,20,10);

fill (255); //neusgat links
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX-5,monsterY+1,3,3);

fill (255); //neusgat rechts
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX+5,monsterY+1,3,3);

line (mouseX-15,monsterY+12,mouseX+15,monsterY+12); //mond
triangle(mouseX-10, monsterY+12, mouseX-4, monsterY+18, mouseX+2, monsterY+12); //tand


// voet links
 if( test == true){
   fill(209,209,209);
 }
 else {
   fill (90,45,7);
 }
ellipseMode(CENTER);
stroke(0);
ellipse( mouseX-30,monsterY+35,40,40);

// voet rechts
 if( test == true){
   fill(209,209,209);
 }
 else {
   fill (90,45,7);
 }
ellipseMode(CENTER);
stroke(0);
ellipse( mouseX+30,monsterY+35,40,40);

line (mouseX-25,monsterY-35,mouseX-5,monsterY-30); //wenkbrauw links

fill(0); // oog links
stroke(0);
rect( mouseX-10,monsterY-25,2,15,2); 

line (mouseX+5,monsterY-30,mouseX+25,monsterY-35); //wenkbrauw rechts

fill (0); // oog rechts
stroke(0);
rect( mouseX+10,monsterY-25,2,15,2); 

line(mouseX+50,monsterY-20,mouseX+50,monsterY-80); //touw ballon

fill (255,0,0);// ballon
ellipseMode(CENTER);
ellipse( mouseX+50,monsterY-100,60,60);

triangle(mouseX+45, monsterY-60, mouseX+50, monsterY-70, mouseX+55, monsterY-60);

/*fill (255); // bite
ellipseMode(CENTER); 
noStroke();
ellipse( mouseX-50,monsterY-56,10,10);
fill (255); 
ellipseMode(CENTER); 
noStroke();
ellipse( mouseX-44,monsterY-61,10,10);
*/
}

void moving(){
monsterY = monsterY + richting;

 if(monsterY > 145 || monsterY <-60){
    richting= -richting;
    teller = teller+1;
  }
  
  if(teller == 10){
teller=0;
test =!test;
  }
 }


