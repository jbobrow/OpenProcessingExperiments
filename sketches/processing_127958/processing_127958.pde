
//in open processing werkt het bestand wel!

int monstertjeX;
int monstertjeY;
int richting=10;
int teller;
boolean test;

int y;
int spatie;
int stop;

void setup(){
    size(500,500);
    monstertjeX=500;
    monstertjeY=500;
    
    y=0;
    spatie=20;
    stop=500;
}

void draw() {
    background(255);
    
    while(y < stop){
      noStroke();
      fill(230);
      rect(0,y,500,5);
      y = y + spatie;
    }
    
    update();
    test();
    teken();
    
    y=0;
} 

void teken(){
    noStroke();
    fill(0);
    ellipseMode(CENTER);
    ellipse(monstertjeX-35,monstertjeY-20,30,30);        //left ear*/
    ellipse(monstertjeX+35,monstertjeY-20,30,30);      //right ear*/
    ellipse(monstertjeX,monstertjeY+60,90,90);      //body*/

    stroke(0);
    fill(255);
    ellipse(monstertjeX,monstertjeY+60,60,60);      //belly*//
    ellipse(monstertjeX,monstertjeY,75,75);       //Head*/
    
    noStroke();
    fill(0);
    ellipse(monstertjeX+30,monstertjeY+90,40,40);      //right foot*/
    ellipse(monstertjeX-20,monstertjeY+90,40,40);       //left foot*/
    ellipse(monstertjeX-35,monstertjeY+45,32,32);      //left hand*/
    ellipse(monstertjeX+35,monstertjeY+45,32,32);      //right hand*/
    ellipse(monstertjeX+15,monstertjeY-5,30,28);      //black spot in face*/
    
    stroke(0);
    fill(255);
    ellipse(monstertjeX+15,monstertjeY-5,15,15);      //right eye*/
    ellipse(monstertjeX-15,monstertjeY-5,15,15);      //left eye*/
    ellipse(monstertjeX,monstertjeY+15,35,20);    //white nose*/
    
    noStroke();
     if(test == true) { fill(255,0,0);}
     if(test == false) { fill(0,0,255);}
    ellipseMode(CENTER);
    ellipse(monstertjeX,monstertjeY+10,15,10);    //nose*/
    
    noStroke();
    fill(0);
    ellipse(monstertjeX+15,monstertjeY-5,5,5);        //right pupil*/
    ellipse(monstertjeX-15,monstertjeY-5,5,5);        //left pupil*/

    noStroke();
    fill(255);
    ellipse(monstertjeX-35,monstertjeY+45,20,20);    //left white hand*/
    ellipse(monstertjeX+35,monstertjeY+45,20,20);  //right white hand*/
    ellipse(monstertjeX+30,monstertjeY+90,30,30);    //right white foot*/
    ellipse(monstertjeX-20,monstertjeY+90,30,30);    //left white foot*/
    //einde monstertje
    } 
    
void update(){
    monstertjeY = mouseY;
   
   monstertjeX = monstertjeX + richting;
   if(monstertjeX > width) {
     teller = teller + 1;
     richting = - richting;}
     
   if(monstertjeX < 0){
     teller = teller + 1;
     richting = - richting;}
} 

void test(){
  if(teller == 10) {
    test = !test;
    teller = 0;}

 println(monstertjeX);
 println(monstertjeY);
 println(teller);
}
  
  

