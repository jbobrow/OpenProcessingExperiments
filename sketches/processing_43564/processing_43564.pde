
float data[] = {1.8, 1.1,.541,.241,.317,.169}; //# in thousands,street,emergen.shelter,trans housing,treatment centers,jails,hospitals
String names[] = {"hospitals", "jails", "treatment centers", "transitional housing", " emergency shelter", "unsheltered" } ;
void setup(){
  background(0);
  size(1000,200);
  smooth();
}
void draw(){
  background(255);
 for(int i = 0; i < data.length; i++){ //iterate through the array
    float ellSize = map(data[i],2,50,1,100); //map numbers to ellipse size
    stroke(0);
    line(i*150+100,100,ellSize,ellSize);
    if(dist(mouseX,mouseY,i*150+100,100) < 10){
      fill(0);
      }
      ellipse(i*150+100,100,10,10);
      text(names[i], i*150+115,100);
      textSize(14);
      
    }
  }
      
                                
