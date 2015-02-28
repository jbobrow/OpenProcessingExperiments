
final int CENTER_PITCH_Y = 350;
final int CENTER_PITCH_X = 425;
final int CENTER_PITCH_WIDTH = 350;
final int CENTER_PITCH_HEIGHT = 650;
final int PLAYERS = 24;
final int TEAMS = 15;
final float SOUTH = 0.3;
final int  NORTH_X=100, NORTH_Y=100, NORTH_WIDTH=50, NORTH_HEIGHT=50; 
final int  SOUTH_X=100, SOUTH_Y=150, SOUTH_WIDTH=50, SOUTH_HEIGHT=50;
final int STATS_X = 750, STATS_Y = 120, STATS_WIDTH = 190, STATS_HEIGHT = 200;
int j = 0;
int y1;
int x1;
Player[] player = new Player[PLAYERS];
Teams[] teams = new Teams[TEAMS];
boolean north = false;
void setup()
{
  ellipseMode(CENTER);
  size(850,700);  
  y1=25;

   
   player[0] = new Player(0, 0.5, "GK", "DEFENDER", 0, 26, 37, "Goalkeeper"); //NORTH
   player[1] = new Player(0, 0.35, "FB", "DEFENDER", 0, 48, 35, "Full Back");
   player[2] = new Player((-0.30), 0.25, "LB", "DEFENDER", 0, 47, 37, "Wing Back");
   player[3] = new Player((0.30), 0.25, "RB", "DEFENDER", 1, 45, 28, "Wing Back");
   player[4] = new Player(0, 0.15, "HB", "DEFENDER", 2, 50, 24, "Half Back");
   player[5] = new Player((-0.3), 0, "LC", "MIDFIELDER", 3, 42, 16, "Wing Center");
   player[6] = new Player(0, 0, "FC", "MIDFIELDER", 5, 42, 14, "Full Center");
   player[7] = new Player(0.3, 0, "RC", "MIDFIELDER", 4, 43, 13, "Wing Center");
   player[8] = new Player(0, -0.15, "HF", "FORWARD", 7, 40, 10, "Half Forward");
   player[9] = new Player((-0.3), -0.25, "LF", "FORWARD", 3, 42, 16, "Wing Forward");
   player[10] = new Player(0.3, -0.25, "RF", "FORWARD", 11, 31, 19, "Wing Forward");
   player[11] = new Player(0, -0.35, "FF", "FORWARD", 12, 30,7, "Full Forward"); 
   player[12] = new Player(0, 0.5, "GK", "DEFENDER", 0, 24, 40, "Goalkeeper"); //SOUTH
   player[13] = new Player(-0.3, 0.40, "FB", "DEFENDER", 1, 44, 34, "Full Back");
   player[14] = new Player(0.3, 0.40, "FB", "DEFENDER", 0, 44, 32, "Full Back");
   player[15] = new Player(-0.3, 0.2, "HB", "DEFENDER", 0, 40, 26, "Half Back");
   player[16] = new Player(0.3, 0.2, "HB", "DEFENDER", 1, 38, 28, "Half Back");
   player[17] = new Player((-0.3), 0, "LC", "MIDFIELDER", 4, 31, 17, "Wing Center");
   player[18] = new Player(0, 0, "FC", "MIDFIELDER", 6, 37, 19, "Full Center");
   player[19] = new Player(0.3, 0, "RC", "MIDFIELDER", 5, 34, 16, "Right Center");
   player[20] = new Player(-0.3, -0.2, "HF", "FORWARD", 9, 26, 12, "Half Forward");
   player[21] = new Player(0.3, -0.2, "HF", "FORWARD", 7, 27, 9, "Half Forward");
   player[22] = new Player(-0.3, -0.35, "FF", "FORWARD", 13, 22, 11, "Full Forward");
   player[23] = new Player(0.3, -0.35, "FF", "FORWARD", 9, 20, 8, "Full Forward");
   
   teams[0] = new Teams("Kilmallie", 15, 14, 1, 0, 28, 645, 320); //NORTH
   teams[1] = new Teams("Beauly", 15, 12, 2, 1, 25, 645, 340);
   teams[2] = new Teams("Caberfeidh", 15, 7, 7, 1, 15, 645, 360);
   teams[3] = new Teams("Skye", 15, 6, 7, 2, 14, 645, 380);
   teams[4] = new Teams("Strathglass", 15, 1, 12, 2, 5, 645, 400);
   teams[5] = new Teams("Inverness", 15, 1, 13, 1, 3, 645, 420);
   teams[6] = new Teams("Glasgow", 16, 13, 1, 2, 28, 645, 320); //SOUTH
   teams[7] = new Teams("Bute", 16, 11, 3, 2, 24, 645, 340);
   teams[8] = new Teams("Glenorchy", 16, 9, 4, 3, 21, 645, 360);
   teams[9] = new Teams("Lochside", 16, 10, 5, 1, 21, 645, 380);
   teams[10] = new Teams("Aberdour", 16, 6, 9, 1, 13, 645, 400);
   teams[11] = new Teams("Taynuilt", 16, 5, 9, 2, 12, 645, 420);
   teams[12] = new Teams("Oban Celtic", 16, 5, 10, 1, 11, 645, 440);
   teams[13] = new Teams("Kilmory", 16, 2, 11, 3, 7, 645, 460);
   teams[14] = new Teams("Strachur", 16, 2, 11, 3, 7, 645, 480);
}

void draw() 
{
  
  displayField(); 
  displayButtons();
  displayStatsBox();
  
  if(north == true)
  {
    for (int i = 0; i < PLAYERS/2; i++)
    {
    checkHover(i);
    }
    for(j = 0; j < PLAYERS/2; j++)
    {
      player[j].display_player(); 
    }
  }
  else
  {
    for (int i = 12; i < PLAYERS; i++)
    {
    checkHover(i);
    }
    for(j = 12; j < PLAYERS; j++)
    {
      player[j].display_player(); 
    }
  }
  staticTable();
  setTable();
  
}

void displayField()
{
  rectMode(CENTER);
  strokeWeight(3);
 fill(255,168,38);
 rect(425,550,850,425);
 fill(18,98,252);
 rect(425,150,850,425);
 
  fill(255);
  rect(CENTER_PITCH_X, CENTER_PITCH_Y, CENTER_PITCH_WIDTH, CENTER_PITCH_HEIGHT,2); //pitch body
  strokeWeight(2);
  stroke(32,198,44);
  y1 = 27;
  for(int k=0;k<216;k++)
  {println(k);
  line(253,y1,599,y1);
  y1+=3;
  }
x1=252;
 for(int k=0;k<87;k++)
 {println(k);
  line(x1,27,x1,673);
  x1+=4;
  }
  strokeWeight(2);
  stroke(255,0,0);
  fill(255);
  ellipse(CENTER_PITCH_X, CENTER_PITCH_Y, CENTER_PITCH_WIDTH * 0.142, CENTER_PITCH_HEIGHT * 0.076); //bigger center circle
  ellipse(CENTER_PITCH_X, CENTER_PITCH_Y, CENTER_PITCH_WIDTH * 0.014, CENTER_PITCH_HEIGHT * 0.0076); //smaller center circle
  arc(CENTER_PITCH_X * 0.59, CENTER_PITCH_Y * 0.073, CENTER_PITCH_WIDTH * 0.057, CENTER_PITCH_HEIGHT * 0.0307, 0, HALF_PI); //top left arc
  arc(CENTER_PITCH_X * 1.41,CENTER_PITCH_Y * 0.073, CENTER_PITCH_WIDTH * 0.057, CENTER_PITCH_HEIGHT * 0.0307,HALF_PI,PI);  //top right arc
  arc(CENTER_PITCH_X * 1.41, CENTER_PITCH_Y * 1.93, CENTER_PITCH_WIDTH * 0.057, CENTER_PITCH_HEIGHT * 0.0307, PI, PI+HALF_PI); //bottom right arc
  arc(CENTER_PITCH_X * 0.59, CENTER_PITCH_Y * 1.93, CENTER_PITCH_WIDTH * 0.057, CENTER_PITCH_HEIGHT * 0.0307,0-HALF_PI,0); //bottom left arc
  arc(CENTER_PITCH_X, CENTER_PITCH_Y * 0.073, CENTER_PITCH_WIDTH * 0.142, CENTER_PITCH_HEIGHT * 0.076, 0, PI); //top semi box
  rect(CENTER_PITCH_X, CENTER_PITCH_Y * 0.073, CENTER_PITCH_WIDTH * 0.08, CENTER_PITCH_HEIGHT * 0.025); //top goal
  arc(CENTER_PITCH_X, CENTER_PITCH_Y * 1.93, CENTER_PITCH_WIDTH * 0.142, CENTER_PITCH_HEIGHT * 0.076, 0-PI, 0); //bottom semi box
  rect(CENTER_PITCH_X, CENTER_PITCH_Y * 1.93, CENTER_PITCH_WIDTH * 0.08, CENTER_PITCH_HEIGHT * 0.025); //bottom goal
  arc(CENTER_PITCH_X, CENTER_PITCH_Y * 1.7, CENTER_PITCH_WIDTH * 0.142, CENTER_PITCH_HEIGHT * 0.076, 0-PI, 0); //penalty arc
  arc(CENTER_PITCH_X, CENTER_PITCH_Y * 0.3, CENTER_PITCH_WIDTH * 0.142, CENTER_PITCH_HEIGHT * 0.076, 0, PI); //penalty arc
  ellipse(CENTER_PITCH_X, CENTER_PITCH_Y * 0.3, CENTER_PITCH_WIDTH * 0.014, CENTER_PITCH_HEIGHT * 0.0076);  //penalty spot
  ellipse(CENTER_PITCH_X, CENTER_PITCH_Y * 1.7, CENTER_PITCH_WIDTH * 0.014, CENTER_PITCH_HEIGHT * 0.0076); //penalty spot
  stroke(0);  
  
}


class Player
{
   
   float xPosition;
   float yPosition;
   String stick;
   String position;
   int goals;
   int passes;
   int tackles;
   String name;
   Player(float temp_xPosition, float temp_yPosition, String temp_position, String temp_stick, int temp_goals, int temp_passes, int temp_tackles, String temp_name)
   {
      xPosition = temp_xPosition;
      yPosition = temp_yPosition;
      stick = temp_stick;
      position = temp_position;
      goals = temp_goals;
      passes = temp_passes;
      tackles = temp_tackles;
      name = temp_name;
   } 
   private void display_player()
   {
       ellipseMode(CENTER);
       fill(255);
       
       ellipse((CENTER_PITCH_X + (CENTER_PITCH_WIDTH * xPosition)), (CENTER_PITCH_Y + (CENTER_PITCH_HEIGHT * yPosition)), 26, 26);
       fill(0);
       textSize(10);
       textAlign(CENTER);
       text(position, (CENTER_PITCH_X + (CENTER_PITCH_WIDTH * xPosition)), (CENTER_PITCH_Y + (CENTER_PITCH_HEIGHT * yPosition) + 3));
       
   }
   private void display_stats() 
   {
      fill(0);
      textSize(15);
      textAlign(LEFT);
      text("Position: " + name, STATS_X - (STATS_WIDTH * 0.45), STATS_Y - (STATS_HEIGHT * 0.35));
      text("Goals: " + goals, STATS_X - (STATS_WIDTH * 0.45), STATS_Y - (STATS_HEIGHT * 0.25));
      text("Passes: " + passes, STATS_X - (STATS_WIDTH * 0.45), STATS_Y - (STATS_HEIGHT * 0.15));
      text("Tackles: " + tackles, STATS_X - (STATS_WIDTH * 0.45), STATS_Y + (STATS_HEIGHT * 0.-10));
      text("Stick Type: " + stick, STATS_X - (STATS_WIDTH * 0.45), STATS_Y + (STATS_HEIGHT * 0.05));
   }
   public float get_position_x ()
   {
     float position_x = (CENTER_PITCH_X + (CENTER_PITCH_WIDTH * xPosition));
      return position_x; 
   }
   public float get_position_y ()
   {
      float position_y =  (CENTER_PITCH_Y + (CENTER_PITCH_HEIGHT * yPosition));
      return position_y;
   }
}

void mouseReleased()
{
   if((mouseX > (NORTH_X + (NORTH_WIDTH * (-0.5))) && mouseX < NORTH_X + (NORTH_WIDTH * 0.5)) && (mouseY > NORTH_Y + (NORTH_HEIGHT * (-0.5)) && mouseY < NORTH_Y + (NORTH_HEIGHT * 0.5)))
   {
      north = true;
   }
   else if ((mouseX > (SOUTH_X + (SOUTH_WIDTH * (-0.5))) && mouseX < SOUTH_X + (SOUTH_WIDTH * 0.5)) && (mouseY > SOUTH_Y + (SOUTH_HEIGHT * (-0.5)) && mouseY < SOUTH_Y + (SOUTH_HEIGHT * 0.5)))
   {
      north = false; 
   }
}

void displayButtons()
{
  strokeWeight(3);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(13);
  fill(18,98,252);
  rect(NORTH_X, NORTH_Y, NORTH_WIDTH, NORTH_HEIGHT,1);
  fill(0);
  text("NORTH", NORTH_X, NORTH_Y);
  fill(255,168,38);
  rect(SOUTH_X, SOUTH_Y, SOUTH_WIDTH, SOUTH_HEIGHT,1);
  fill(0);
  text("SOUTH", SOUTH_X, SOUTH_Y); 
}

void displayStatsBox() 
{
  rectMode(CENTER);
  strokeWeight(3);
  fill(255);
  rect(STATS_X, STATS_Y, STATS_WIDTH, STATS_HEIGHT,7); 
}

void checkHover(int k)
{
  float player_position_x = player[k].get_position_x();
  float player_position_y = player[k].get_position_y();
  if ( (mouseX < (player_position_x + 13) && mouseX > (player_position_x - 13)) && ( mouseY > (player_position_y - 13) && mouseY < (player_position_y + 13)))
   {
      player[k].display_stats();
   } 
}

class Teams
{
  String teamName;
  int gamesPlayed;
  int gamesWon;
  int gamesLost;
  int gamesDrawn;
  int points;
  int xPos;
  int yPos;
  
  Teams(String temp_name, int temp_gamesP, int temp_gamesW, int temp_gamesL, int temp_gamesD, int temp_points, int temp_xPos, int temp_yPos)
 {
   teamName = temp_name;
   gamesPlayed = temp_gamesP;
   gamesWon = temp_gamesW;
   gamesLost = temp_gamesL;
   gamesDrawn = temp_gamesD;
   points = temp_points;
   xPos = temp_xPos;
   yPos = temp_yPos;
 } 
 
 void displayTable()
 {
   fill(0);
   textAlign(LEFT);
   text(teamName, xPos, yPos);
   text(gamesPlayed, xPos+86, yPos);
   text(gamesWon, xPos+106, yPos);
   text(gamesDrawn, xPos+126, yPos);
   text(gamesLost, xPos+146, yPos);
   text(points, xPos+166, yPos);
 }

}

void setTable()
  {
    int i;
    
    if(north == true)
    {
       for(i=0; i<6; i++)
       {
        teams[i].displayTable(); 
       }
    } 
    
    else
    {
     for(i=6; i<15; i++)
       {
        teams[i].displayTable(); 
       } 
    }
  }
  
void staticTable()
{
  if(north==false)
  {
    fill(255);
    strokeWeight(1);
    rect(730, 255, 200, 40, 5); 
    rect(730, 380, 200, 210, 5); 
    fill(0);
    textSize(15);
    text("Marine Harvest", 730, 250);
    text("South Division 1", 730, 270);
    text("TEAM", 680, 295);
    text("GP", 740, 295);
    text("W", 760, 295);
    text("D", 780, 295);
    text("L", 800, 295);
    text("P", 820, 295);
    line(630, 300, 830, 300);
    line(630, 325, 830, 325);
    line(630, 345, 830, 345);
    line(630, 365, 830, 365);
    line(630, 385, 830, 385);
    line(630, 405, 830, 405);
    line(630, 425, 830, 425);
    line(630, 445, 830, 445);
    line(630, 465, 830, 465);
    stroke(255,0,0);
    line(730, 275, 730, 485);
    line(750, 275, 750, 485);
    line(770, 275, 770, 485);
    line(790, 275, 790, 485);
    line(810, 275, 810, 485);
    stroke(0);
    
    textSize(25);
    fill(255);
    rect(150,300, 150, 50, 5);
    fill(0);
    text("SOUTH", 150, 310);
    
    textSize(15);
  }
  
  else
  {
    fill(255);
    
    strokeWeight(1);
    rect(730, 255, 200, 40, 5);
    rect(730, 380, 200, 210, 5); 
    fill(0);
    textSize(15);
    text("Marine Harvest", 730, 250);
    text("North Division 1", 730, 270);
    text("TEAM", 680, 295);
    text("GP", 740, 295);
    text("W", 760, 295);
    text("D", 780, 295);
    text("L", 800, 295);
    text("P", 820, 295);
    line(630, 300, 830, 300);
    line(630, 325, 830, 325);
    line(630, 345, 830, 345);
    line(630, 365, 830, 365);
    line(630, 385, 830, 385);
    line(630, 405, 830, 405);
    line(630, 425, 830, 425);
    line(630, 445, 830, 445);
    line(630, 465, 830, 465);
    stroke(255,0,0);
    line(730, 275, 730, 485);
    line(750, 275, 750, 485);
    line(770, 275, 770, 485);
    line(790, 275, 790, 485);
    line(810, 275, 810, 485);
    stroke(0);
    
    textSize(25);
    fill(255);
    rect(150,300, 150, 50, 5);
    fill(0);
    text("NORTH", 150, 310);
    
    textSize(15);
  }
}





