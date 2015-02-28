
float data[] = {3.6,5.1,3.8,4.3}; //homeless population per year
String names[] = {"2005", "2007", "2009", "2011" } ; //years
void setup(){
  background(0);
  size(800,800);
  smooth();
  
    
}
  
void draw(){
  background((25),(30),(70));
 for(int i = 0; i < data.length; i++){ //iterate through the array
    float ellSize = map(data[i],2,50,1,100); //map numbers to ellipse size
  
    stroke(random(255),(40),(75));
    line(i*150+100,100,ellSize,ellSize);
    if(dist(mouseX,mouseY,i*150+100,100) < 100){
      fill(205,30,45);
      ellipse(i*150+100,100,10,10);
      text(names[i], i*150+115,100);
      textSize(14);
    stroke(255);
    text("Homeless population in LA");
      
        
        
    }
  }
} 
