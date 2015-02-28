
float data[] = {1.9,1.6,1.3,1.09}; //imports
String names[] = {"U.S.A", "E.U", "China", "Germany" } ; //names fo countries
void setup(){
  background(0);
  size(800,200);
  smooth();
  
}

void draw(){
  background(0);
  
  for(int i = 0; i < data.length; i++){ //iterate through the array
    float ellSize = map(data[i],0,3,1,100); //map numbers to ellipse size

    stroke(255);
    line(i*150+100,100,ellSize,ellSize); 
    if(dist(mouseX,mouseY,i*150+100,100) < 100){
      fill(30,50,90);
      ellipse(i*150+100,100,10,10);
      text(names[i], i*150+115,100);
      
      
    }
  }  
}  
             
