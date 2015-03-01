
float[] grayValueForArray;
FloatList grayValueForList;
int num;
void setup(){  
  size(400,300);
  num = 3;
  grayValueForArray = new float[num];
 
  for(int i= 0; i < num; i++)
      grayValueForArray[i] = 80 * i;

  grayValueForList = new FloatList();
  for(int i= 0; i < num; i++)
       grayValueForList.append(80 * i);
}
void draw(){
  background(255);
  noStroke();
  
  for(int i = 0; i < num;i++){
    fill(grayValueForArray[i]);
    ellipse(100+100*i,100,40,40);
  }
  for(int i = 0; i < num;i++){
    fill( grayValueForList.get(i));
    ellipse(100+100*i,200,40,40);
  }


}
