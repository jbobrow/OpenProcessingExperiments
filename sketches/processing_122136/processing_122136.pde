
int directionX;
int x;
int directionY;
int y;
float data[] = {1.8, 1.1,.541,.241,.317,.169}; //# in thousands,street,emergen.shelter,trans housing,treatment centers,jails,hospitals
//String names[] = {"2005", "2007", "2009", "2011" } ; //



void setup(){
  background(25);
  size(900,200);
  smooth();
}
    
void draw(){
  for(int i = 0; i < data.length; i++){ //iterate through the array
  float ellSize = map(data[i],2,50,1,100); //map numbers to ellipse size
  fill(221,250,8);
  rect(650,80,60,500);

 
 
  strokeWeight(7);
  line(100,80,100,580);
  line(i*150+100,100,ellSize,ellSize);
  if(y<25){
    directionY =-1;
  if(dist(mouseX,mouseY,i*150+100,100) < 15){
  rect(i*150+100,100,15,190);//text(names[i], i*150+115,100);
    }
   }
 }
}              
                                
