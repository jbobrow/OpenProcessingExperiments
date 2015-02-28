
float data[] = {3.3,14.5,3.8,13.0,10.8,8.4}; //hours of sleep per day
String names[] = {"African Elephant", "Cat", "Goat", "Grey wolf", "Jaguar", "Rabbit" } ; //names or animals
void setup(){
  background(0);
  size(800,800);
  smooth();
  textSize(14);
  //ext("Hourse of Sleep");
   
}
 
void draw(){
  background((255),(30),(70));

   
  for(int i = 0; i < data.length; i++){ //iterate through the array
    float ellSize = map(data[i],0,1,1,100); //map numbers to ellipse size
 
    stroke(random(255),(40),(75));
    line(i*150+100,100,ellSize,ellSize);
    if(dist(mouseX,mouseY,i*150+100,100) < 100){
      fill(205,30,45);
      ellipse(i*150+100,100,10,10);
      text(names[i], i*150+115,100);
     
       
       
    }
  } 
} 

