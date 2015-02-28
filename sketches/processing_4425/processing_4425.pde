
//Interactive Representation of Sydney
//tRoom by corneel cannaerts http://www.openprocessing.org/visuals/?visualID=3706

PImage i;
int c=0;

void setup(){
 size(500,500);
 smooth();
 frameRate(20);
 }
 
void draw(){
 i=get();
 tint(250);
 image(i,2.5,2.5,496,496);//changed numbers to make it more square like
 if(c%90>random(1,90)&&c%90<random(1,90))ellipse(random(50, 450), random(50, 450), 50, 50); //people
 // made a random timeslot in which ellipses would appear at random spots
 c++;
}

//added a mouse  click option

void mousePressed(){
 i=get();
 tint(random(150, 255), random(150, 255), random(150, 255));
 // made a random tint when clicking
 image(i,1,2,496,495);
 // created timeslots of varying time lengths and restrictions to make different effects.
 if(c%10>3&&c%10<7)rect(random(30, 300), random(25, 350), 125, 125); //cars
 if(c%10>3&&c%10<7)rect(random(30, 300), random(25, 350), 125, 125); //cars
 if(c%90>26&&c%90<30)rect(200, 50, 100, 400); //train
 if(c%90>76&&c%90<80)rect(200, 50, 100, 400); //train
 if(c%90>43&&c%90<47)rect(5, 5, 475, 475); //bus
 //when this clicked and it occurs rarely, the screen should become white
 //this is to express how you can always seem to wait ages for a bus
 if(c%90>1&&c%90<90)ellipse(random(50, 450), random(50, 450), 50, 50); //people
 if(c%90>1&&c%90<90)ellipse(random(50, 450), random(50, 450), 50, 50);
 if(c%90>1&&c%90<90)ellipse(random(50, 450), random(50, 450), 50, 50);
 if(c%90>1&&c%90<90)ellipse(random(50, 450), random(50, 450), 50, 50);
 if(c%90>1&&c%90<90)ellipse(random(50, 450), random(50, 450), 50, 50);
 if(c%90>1&&c%90<90)ellipse(random(50, 450), random(50, 450), 50, 50);
 if(c%90>1&&c%90<90)ellipse(random(50, 450), random(50, 450), 50, 50);
 if(c%90>1&&c%90<90)ellipse(random(50, 450), random(50, 450), 50, 50);
 c++;
}

