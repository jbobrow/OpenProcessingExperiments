
class Block
{
  int type;
  String description = "";
  
  Block(int t, String d)
  {
     type = t;
     description = d;
  } 
  
  void draw(float x, float y)
  {

     if(type == 0)    // Bloc Infranchissable pour le héros par exemple
    {
       strokeWeight(1);       
       fill(255,100,100);
       rect(x, y, Perlin_RoomExplorer.blockSizeX, Perlin_RoomExplorer.blockSizeY);
    }
    else if(type == 1)  // Bloc d'Entrée (dérivé pour potentiellement en changer la couleur suivant la direction)
    {
       if(description == "west")
       {
         strokeWeight(1);       
         fill(100,100,255);
         rect(x, y, Perlin_RoomExplorer.blockSizeX, Perlin_RoomExplorer.blockSizeY);
       }
       else if (description == "north")
       {
         strokeWeight(1);       
         fill(100,100,255);
         rect(x, y, Perlin_RoomExplorer.blockSizeX, Perlin_RoomExplorer.blockSizeY);         
       }
       else if (description == "east")
       {
         strokeWeight(1);       
         fill(100,100,255);
         rect(x, y, Perlin_RoomExplorer.blockSizeX, Perlin_RoomExplorer.blockSizeY);         
       }
       else if (description == "south")
       {
         strokeWeight(1);       
         fill(100,100,255);
         rect(x, y, Perlin_RoomExplorer.blockSizeX, Perlin_RoomExplorer.blockSizeY);         
       }
    }
    // Ancien code, qui dessinait des carrés blancs sur chaque bloc vide (empêchait de voir le sol)
/*    else      
    {
         noStroke();
         fill(255);
         rect(x, y, Perlin_RoomExplorer.blockSizeX, Perlin_RoomExplorer.blockSizeY);     
    }
*/    
  }
}

