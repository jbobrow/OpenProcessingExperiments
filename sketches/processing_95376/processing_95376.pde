
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

SCScore myScore = new SCScore();
int value=1;
int change=0;
int r,g,b;
float []noteArray = new float[4];
void setup()
{
  size(400,400);
  frameRate(1);
  //myNote.tempo(60);

}

void draw()
{
  change=value;
  for(int i=0;i<noteArray.length;i++)
  {
  noteArray[i]=random(127);
  
  }
  if(mouseX<width/2 && mouseY < height/2)
     {
     value=1;
   
     myScore.addNote(0,noteArray[0],100,1);
 
     }   
  else
      if(mouseX>=width/2 &&mouseY;<height/2)
         {
          value=2;
          float note=random(127);
         myScore.addNote(1,noteArray[1],80,0.25);
        }
        else if(mouseX< width/2 && mouseY>=height/2)
              {
              
              value=3;
       
               myScore.addNote(2,noteArray[2],110,0.5);   
             
              }
              else
              {
             value=4; 
             myScore.addNote(3,noteArray[3],100,1);
             
              }
          
         if(value ==1 && change !=1)  
              {
              r=(int )random(255);
              g=(int )random(255);
              b=(int )random(255);
              fill(r,g,b);
              rect(0,0,width/2,height/2); 
              myScore.play();
              }
         else    
         if(value ==2 && change !=2)  
              {
              r=(int )random(255);
              g=(int )random(255);
              b=(int )random(255);
              fill(r,g,b);
              rect(width/2,0,width/2,height/2); 
                myScore.play();
              }   
          else    
          if(value ==3 && change !=3)  
              {
              r=(int )random(255);
              g=(int )random(255);
              b=(int )random(255);
              fill(r,g,b);
              rect(0,height/2,width/2,height/2); 
               myScore.play();
              }
            else  
             if(value ==4 && change !=4)  
              {
              r=(int )random(255);
              g=(int )random(255);
              b=(int )random(255);
              fill(r,g,b);
              rect(width/2,height/2,width/2,height/2);  
               myScore.play();
              }
  
        println("Change contains the prebious number that value held: " + change);
        println("Valude holds the current quandoant number: "+ value); 
  
}
