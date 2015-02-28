
/** game_of_salat
 * created by avogatro july 2009
 *
 *THE WORK (AS DEFINED BELOW) IS PROVIDED UNDER THE TERMS OF THIS CREATIVE COMMONS PUBLIC LICENSE ("CCPL" OR "LICENSE"). 
 *THE WORK IS PROTECTED BY COPYRIGHT AND/OR OTHER APPLICABLE LAW. ANY USE OF THE WORK OTHER THAN AS AUTHORIZED UNDER
 *THIS LICENSE OR COPYRIGHT LAW IS PROHIBITED.
 *BY EXERCISING ANY RIGHTS TO THE WORK PROVIDED HERE, YOU ACCEPT AND AGREE TO BE BOUND BY THE TERMS OF THIS LICENSE. 
 *TO THE EXTENT THIS LICENSE MAY BE CONSIDERED TO BE A CONTRACT, THE LICENSOR GRANTS YOU THE RIGHTS CONTAINED HERE 
 *IN CONSIDERATION OF YOUR ACCEPTANCE OF SUCH TERMS AND CONDITIONS.
 *
 */

//global var and constant
int fieldSize = 600;
boolean stoped= false;
float hypA = 10;//  hyperbel radius A
float hypB = 15;//  hyperbel radius B

boolean [][][] field;
int bit24 = int(pow(2,24));
int bit16 = int (pow(2,16));
int bit8 = int(pow(2,8));
void setup(){

  size(fieldSize,fieldSize,P2D);
  // change color mode: default RGB
  colorMode(HSB,360,360,10);

  field = new boolean[fieldSize][fieldSize][3];
  for (int b=0;b<fieldSize;b++){
    for (int a=0;a<fieldSize;a++){
      //first 2 field is status for tested or not
      field[b][a][0]=false;
      field[b][a][1]=false;
      //chance to generate 2 branches at one time
      //in hyperbel area , there is more chance 
      if ((b*b/hypA/hypA-a*a/hypB/hypB<5)||(random(1)>0.5))
        field[b][a][2]=false;
      else
        field[b][a][2]=true;
    }
  }
  background(0);
  noFill();
  //draw first point
  point(width/2,height/2);
  field[width/2][height/2][0]=true;
  field[width/2][height/2][1]=false;
}
void draw(){
  int new_point_counter=0;
  //change color
  stroke(frameCount%120+20,360,frameCount%360,frameCount%(fieldSize/3));
  if (stoped == true){
    if (frameCount<60){
      mouseReleased();
    }
  }else{

    //create data for draw
    // for every drawed point search randomly 1 or 2 branches, which are neighbors of the origin. 
    for (int b=0;b<fieldSize;b++){
      for (int a=0;a<fieldSize;a++){
        if ((field[b][a][0]==true)&&(field[b][a][1]==false)){

          float angle = random(0,TWO_PI);
          if ((b+round(sin(angle))<fieldSize)&& (a+round(cos(angle))<fieldSize)&&(b+round(sin(angle))>=0)&&((a+round(cos(angle)))>0)){
            if (field[b+round(sin(angle))][a+round(cos(angle))][0]==false){
              field[b+round(sin(angle))][a+round(cos(angle))][1] = true;
              field[b][a][1]=true;
              new_point_counter++;
            }
          }
          //additional chance to create second branche
          if (!field[b][a][2]){
            field[b][a][2]=true;
            field[b][a][1]=true;
            angle = random(0,TWO_PI);
            if ((b+round(sin(angle))<fieldSize)&& (a+round(cos(angle))<fieldSize)&&(b+round(sin(angle))>=0)&&((a+round(cos(angle)))>0)){
              if (field[b+round(sin(angle))][a+round(cos(angle))][0]==false){
                field[b+round(sin(angle))][a+round(cos(angle))][1] = true;
                field[b][a][1]=true;
                new_point_counter++;
              }
            }
          }

        }
      }
    }
    // draw new points
    if (new_point_counter>0){
      for (int b=0;b<fieldSize;b++){
        for (int a=0;a<fieldSize;a++){
          if ((field[b][a][0]==false)&&(field[b][a][1]==true)){
            field[b][a][1]=false;
            field[b][a][0]=true;
            point(b,a);
          }
        }
      }
    }
    else{
      stoped=true;
    }
  }
}

void mouseReleased() {
  
  for (int b=0;b<fieldSize;b++){
    for (int a=0;a<fieldSize;a++){
      //first 2 field is status for tested or not
      field[b][a][0]=false;
      field[b][a][1]=false;
      //chance to generate 2 branches at one time
      //in hyperbel area , there is more chance 
      if ((b*b/hypA/hypA-a*a/hypB/hypB<5)||(random(1)>0.5))
        field[b][a][2]=false;
      else
        field[b][a][2]=true;
    }
  }
  background(0);
  stroke(0);
  fill(0);
  rect(0,0,fieldSize,fieldSize);





  stroke(255-frameCount%100,frameCount%100);
  //draw first point
  point(width/2,height/2);
  field[width/2][height/2][0]=true;
  field[width/2][height/2][1]=false;
  stoped =false;
  frameCount=0;
}


