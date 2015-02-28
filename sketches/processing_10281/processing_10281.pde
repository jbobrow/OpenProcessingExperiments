
 public class Patterns{
   boolean NeedReset = false;
   int LastSelection = 0;
   LedCube cube;
   
   private int x,y,z;
   
   Patterns()
   {
     cube = null;
   }
   Patterns(LedCube _cube)
   {
     cube = _cube;
   }
   /****************************************GetPatterns********************************************/
   public void GetPatterns(int selection){
     
      if (NeedReset){
        ResetCouleurs();
        NeedReset = false;
      }
      
      switch(selection)
        {
        case '1':
        ArcEnCiel();
        break;
        case '2':
        cube.led(0,0,0,0xF59F00);  //hexadécimal: peut être vu comme 0-255(R),0-255(G),0-255(B)
        break;
        case '3':
        Temps();
        break; 
        case '4':
        Aleatoire();
        break;
        case '5':
        AleatoireCouleur(round(random(pow(2,24))));
        break;
        case '6':
        Strates(1);
        break;
        case '7':
        RotationMilieu();
        break; 
        default:
        ResetCouleurs();  
        break;
        }
        
        if(LastSelection != selection){
          NeedReset = true;
        }
        LastSelection=selection;
   }
   
   /************************************Remise à zéro********************************************/
    private void ResetCouleurs(){
      for(z=0;z<3;z++){
        for(x=0;x<3;x++){
          for(y=0;y<3;y++){
           cube.led(z,x,y, 0x333333);
          }
        }
      }
    }
      /************************************Aleatoire********************************************/
      private boolean ale_lock = true;
      private void Aleatoire(){
        if (frameCount%10 == 0)
         ale_lock = false;
        
        if(!ale_lock)
        {
          ale_lock = true;
          for(z=0;z<3;z++)
            for(x=0;x<3;x++)
              for(y=0;y<3;y++)
                cube.led(z,x,y,round(random(pow(2,24))));
        }
      }
      
      /************************************ArcEnCiel********************************************/
      private void ArcEnCiel(){
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,cube.rgb2encodage(z*80+80,x*80+80,y*80+80));  
      }
      
      /************************************Temps********************************************/
      private void Temps(){
        for(z=0;z<3;z++)
          for(x=0;x<3;x++)
            for(y=0;y<3;y++)
              cube.led(z,x,y,cube.rgb2encodage(second()*4,second()*8,second()*16));
    }
    
    /************************************Strates********************************************/
     private int str_state = 1;
     private boolean str_lock = true;
     private void Strates(int couche){
       if (frameCount%2 == 0)
         str_lock = false;
        
        if (!str_lock){
          ResetCouleurs();
          str_lock = true;
          switch(++str_state){
            case 1:
            for(x=0;x<3;x++)
              for(y=0;y<3;y++)
                cube.led(0,x,y,0x0022FF);
            break;
            case 2:
             for(x=0;x<3;x++)
              for(y=0;y<3;y++)
                cube.led(1,x,y,0x22FF00);
            break;
            case 3:
            str_state = 0;
            for(x=0;x<3;x++)
              for(y=0;y<3;y++)
                cube.led(2,x,y,0xFF2200);
            break;
            default:
            str_state = 0;
            break;
          }
        }
           
     }
     /************************************Rotation********************************************/
     private int rot_state = 1;
     private boolean rot_lock = true;
     private int[] rot_col1 = {0,0,0,0};
     private int[] rot_col2 = {0,0,0,0};
     private void RotationMilieu(){ 
       if (frameCount%3 == 0)
         rot_lock = false;
        
        if (!rot_lock){
          switch(++rot_state){
            case 1:
            rot_col1[0] = 0;
            rot_col1[1] = 0;
            rot_col2[0] = 2;
            rot_col2[1] = 2;
            break;
            case 2:
            rot_col1[0] = 0;
            rot_col1[1] = 1;
            rot_col2[0] = 2;
            rot_col2[1] = 1;
            break;
            case 3:
            rot_col1[0] = 0;
            rot_col1[1] = 2;
            rot_col2[0] = 2;
            rot_col2[1] = 0;
            break;
            case 4:
            rot_col1[0] = 1;
            rot_col1[1] = 0;
            rot_col2[0] = 1;
            rot_col2[1] = 2;
            rot_state = 0;
            break;
            default:
            rot_state = 0;
            break;
          }
          
          for(z=0;z<3;z++)
          {
              cube.led(z,rot_col1[0],rot_col1[1],0xF00A62);
              cube.led(z,rot_col2[0],rot_col2[1],0xF00A62);
              cube.led(z,1,1,0x00ED35);
              cube.led(z,rot_col1[2],rot_col1[3],0x333333);
              cube.led(z,rot_col2[2],rot_col2[3],0x333333);
          }
          rot_col1[2] = rot_col1[0];
          rot_col1[3] = rot_col1[1];
          rot_col2[2] = rot_col2[0];
          rot_col2[3] = rot_col2[1];
          rot_lock = true;
        }
     }
     
     /************************************AleatoireCouleur********************************************/
     private int oldX,oldY,oldZ,newX,newY,newZ;
     private void AleatoireCouleur(int couleur)
     {                 
        if (frameCount%20 == 0){
          cube.led(oldX,oldY,oldZ,0x333333);
          newX = round(random(2));
          newY = round(random(2));
          newZ = round(random(2));
          cube.led(newX,newY,newZ,couleur); 
          oldX = newX;
          oldY = newY;
          oldZ = newZ;
        }
      }
    /************************************FIN********************************************/
  }

