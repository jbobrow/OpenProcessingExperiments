
void setup (){
  size (283,567); //width and height
  background (0); //background colour
  stroke(255);//colour of line
  strokeWeight(0.5);//thickness of line

int xAmount =25;
int yAmount = 25;

for(int i = 0; i < width; i = i+xAmount){
      for(int j = height; j >0; j = j-yAmount){
       float choice = random (4);
        if(choice<=1){
          line(i,j, i+xAmount,j-yAmount);
        }
        else if (choice>1&&choice<=2){
        line(i,j-yAmount,i+xAmount,j);
        }
       else if (choice>2&&choice<=3){
       line(i,j, i,j-yAmount);
        }
  
 else if (choice>3&&choice<=4){
       line(i,j,i+xAmount,j);
     }

}
}
//filter(BLUR);
}

void draw(){
  
}

void keyPressed()  

//Takes PNG screenshots when you push S  

//Careful - doesn't prompt when overwriting files!  

{  

  if(key == 's' || key == 'S')  

  {  

    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser  

    if(filePath != null)  

    {  

      save(filePath + ".png");  

    }  

  }  

} 


