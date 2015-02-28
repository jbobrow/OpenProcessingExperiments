
//stephanie pence
//midterm
//http://www-958.ibm.com/software/data/cognos/manyeyes/datasets/the-amou
//nt-of-extinct-plants-and-a/versions/1
//extinct animals and plants across US


int extinct1[] = {44,111,19,63,56};
int extinct2[]={273,178,6,28,55};
String states[]= {"Hawaii","California","New York","Texas","Florida"};
PImage flower;
PImage animal;



 
void setup (){
  flower= loadImage("roses.jpg");
  animal= loadImage("sadpuppy.jpg");
 
  background(250,173,162);
  size(700,600);
  smooth();
}
 
void draw(){
 
 background(250,173,162);
 for(int i = 0; i< extinct1.length; i++){
   println(extinct1[i]);
 float imageSize=map(extinct1[i],10,130,0,100);
 image(flower,i*100+150,160,imageSize,imageSize);
 for(int x=0; x<extinct2.length; x++){
   println(extinct2[x]);
 float puppySize=map(extinct2[x],0,280,0,200);
 image(animal,x*100+150,360,imageSize,imageSize);


PFont myfont;
 myfont=loadFont("SimSun-48.vlw");
 textFont(myfont,20);
text(extinct1[i],i*100+160,150);
text(extinct2[i], i*100+160, 360);

fill(0);
text(states[i],i*100+150,70);

text("# extinct",30,160);
text("plants",30,190);
text("# extinct", 30,360);
text("animals", 30, 390);
text("X( Extinct Animals and Plants in... X(", 20,40);
   
 }
 

}
     


}


