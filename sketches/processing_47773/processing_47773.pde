
int living[] = {3,20,16,10,2};
int working[]={5,15,3,17,4};
String DISTRICTS[]= {"Union Square","the Mission","the TL","the Haight","North Beach"};
PImage house;
PImage dollar;
 
 
  
void setup () {
  house= loadImage("house.gif");
  dollar= loadImage("dollar.jpg");
  
  background(0);
  size(700,600);
  smooth();
}
  
void draw(){
  
 background(0);
 for(int i = 0; i< living.length; i++){
   println(living[i]);
 float imageSize=map(living[i],100,40,10,50);
 image(house,i*100+150,160,imageSize,imageSize);
 
 for(int x=0; x<working.length; x++){
   println(working[x]);
 float puppySize=map(working[x],0,280,0,200);
 image(dollar,x*100+150,360,imageSize,imageSize);
 

text(living[i],i*100+160,150);
text(working[i], i*100+160, 360);
 
fill(255,255,255);
text(DISTRICTS[i],i*100+150,70);
 
text("LIVING",30,160);
text("WORKING", 30,360);
text("STUDENTS OUT OF 50 ", 20,40);
    
 }}}

