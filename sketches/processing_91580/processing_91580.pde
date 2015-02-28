
//appended text data
int i = 0;
color [] pal = {#243835,#d6d7bb,#4cb6b8,#857729,#666248};
//setup/////////////////////////////////////////////////////////
void setup(){
size(600,300);
String[] flavors = loadStrings ("FOD for Processing.txt");
println(flavors);
background(pal[0]);
}
//draw/////////////////////////////////////////////////////////
void draw(){
  frameRate(5);
  String[] flavors = loadStrings ("FOD for Processing.txt");
println(flavors);
  background(pal[0]);
  text("click the mouse to see all the wonderful flavors",width/2,10);
  fill(pal[1]);
  text(flavors[i],width/2,height/2);
  if(mousePressed){
    i +=1;
  }
 i = constrain(i,0,55); 
 }
 



