
/*Jenny McCarthy 4/06/14
Internet Art 3001
Final Project: Data Visualization
Family Tree: Joining the Threads of Life
Data comes from several family members' accounts on both my mother's side and my father's side
Inspired by the aesthetics of Stefanie Posevec's projects (http://www.stefanieposavec.co.uk/), such as V&A Memory Palace and (En)tangled Word Bank
*/

String[] data;  //Declare array of strings
Members[] member; //Declare array of member objects
Connections connection; //Declare connection object

void setup(){
  size(1350,700); //1300x700 window display 
  data = loadStrings("Family_Data.csv"); //Load data as an array of strings, credit: Hannah Organick (www.openprocessing.org/sketch/60308) 
  member = new Members[data.length]; //Array of members is the same length as the data
  for (int i=0;i<data.length;i++){ //Input information to the member objects from the data array 
    member[i] = new Members(data[i]); //Initialize array of member objects
  }
  connection = new Connections(); //Initialize connection object
}

void draw(){
  smooth();
  background(0); //Black 
  for (int i=0;i<data.length;i++){ //For each object in the array, a line is created
    member[i].display(); //Displays the objects
  }
  connection.displayMarriages(); //Displays the marriages
  connection.displayDivorces(); //Displays the divorces
  connection.displayRelations(); //Display the relations between family member object
      
  //Interactions with the mouse:
  //Based on Hannah Organick's 2009 Worldwide HIV Statistics Visualization (www.openprocessing.org/sketch/60308) 
  for (int i=0;i<data.length;i++){ //Text will be displayed for each object in the array in the top right corner
      if (dist(member[i].getXpos(),member[i].getYpos(), mouseX, mouseY) < 5){ //If the distance b/w the point xpos,ypos and the mouse is less than 5, then display the text
        //The point at xpos,ypos for each object gets a little larger when rollover occurs as well
        fill(member[i].getC()); //Fill ellipse with color c
        ellipse(member[i].getXpos(),member[i].getYpos(),6,6); //6x6 ellipse at xpos,ypos 
        
        textAlign(CENTER); //Text is centered
        fill(255,200); //White text, opacity 200
        textSize(30); //Text size 30
        text(member[i].getName(),width-100,50); //Displays the family member's name
        
        fill(255,150); //White text, opacity 150
        textSize(15); //Text size 15
        text(member[i].getRelation(),width-100,75); //Displays relation
        text("Born in " + member[i].getB(),width-100,100); //Displays year of birth
        text("Age: " + member[i].getA(),width-100,125); //Displays age
        if (member[i].getD() == 0){ //If family member is still alive, then display "Currently Alive"
          text("Currently Alive",width-100,150);
        } else { //If family member has passed away, then display year of death
          text("Died in " + member[i].getD(),width-100,150); //Displays year of death
        }
        text(member[i].getStatus() + " " + member[i].getSpouse() + " " + member[i].getExspouse(),width-100,175); //Displays marraige status and name of spouse/exspouse
      }
   }

   //Key -->>
   //Color codes come from the assistance of adobe kuler
   
   //Symbols ->
   //Generations
   strokeWeight(2); //Stroke weight of 2
   stroke(52,143,255); //Blue
   line(1325,200,1325,225); //Blue line = earliest generation (1st)
   stroke(66,232,229); //Blue-green
   line(1325,235,1325,260); //Blue-green line = 2nd generation
   stroke(120,255,170); //Sea-green
   line(1325,270,1325,295); //Sea-green line = 3rd generation
   stroke(108,232,55); //Lime green 
   line(1325,305,1325,330); //Lime green line = 4th generation
   stroke(255,251,1); //Yellow
   line(1325,340,1325,365); //Yellow line = 5th genreation
   
   //Side of the family
   noStroke(); //No stroke
   fill(0,160,255,50); //fill shape with blue color, code comes from the adobe kuler
   ellipse(1325,388,25,25); //25x25 circle = my father's side of the family
   fill(255,76,157,50); //Fill shape with pink color, code comes from the adobe kuler
   rect(1325,420,25,25); //25x25 square = my mother's side of the family
   
   //Relations or Connections
   strokeWeight(1); //Stroke weight of 1
   stroke(255,0,0); //Red stroke 
   line(1312,455,1336,455); //Red line = Married
   stroke(255,0,0,150); //Faint red stroke, opacity 150 
   line(1312,490,1336,490); //Faint red line = Divorced
   stroke(255,150); //White stroke, opacity 150 
   line(1312,512,1336,537); //White line = Related by blood, parent-child relationship
   stroke(255,75); //Faint white stroke 
   line(1312,547,1336,572); //Faint white line = Adopted into the family
   
   stroke(66,232,229); //Blue-green
   fill(66,232,229,50); //Blue-green fill, opacity 50
   rect(1325,595,10,30); //Rectangle with point in the center = Person who has married into the family
   point(1325,595); //Point in the center  
   
   //Text->
   fill(255,100); //White text, opacity 100
   textSize(12); //Text size is 12
   text("Generation 1",1250,215); //Displays text next to corresponding symbol
   text("Generation 2",1250,250); //Displays text next to corresponding symbol
   text("Generation 3",1250,285); //Displays text next to corresponding symbol
   text("Generation 4",1250,320); //Displays text next to corresponding symbol
   text("Generation 5",1250,355); //Displays text next to corresponding symbol
   text("Father's Side",1250,395); //Displays text next to corresponding symbol
   text("Mother's Side",1250,425); //Displays text next to corresponding symbol
   text("Married",1250,455); //Displays text next to corresponding symbol
   text("Divorced",1250,490); //Displays text next to corresponding symbol
   text("Parent-Child",1250,525); //Displays text next to corresponding symbol
   text("Adopted",1250,560); //Displays text next to corresponding symbol
   text("Married into Family",1250,595); //Displays text next to corresponding symbol
   
   text("Family Tree: Joining the Threads of Life",150,675); //Displays the title
}
class Connections{ //Variables 
  color c; //Color 1 of lines
  color c2; //Color 2 of lines
  int str; //Stroke weight of lines
  int op; //Opacitcy of lines
  
  Connections(){ //Constructor
    c = color(255,0,0); //Red
    c2 = color(255); //White
    str = 1; //Stroke weight of 1
    op = 150; //Opacity of 150
  }
  
  void displayMarriages(){ //Functions
    //Draw a red line b/w the xpos,ypos of those who are married
    strokeWeight(str); //Strokeweight of 1
    stroke(c); //Red color (color c)
    
    //Generation 1 marriages
    line(325,25,355,58); //Harry - Ally
    line(535,68,925,68); //Roy - Mabel
    line(445,117,415,117); //Erma - Holger
    line(85,122,235,131); //Leslie - Dorothy
    
    //Generation 2 marriages
    line(355,180,385,194); //Edward - Ruby
    line(655,189,595,204); //Leona - Dale
    line(325,199,235,238); //Don - Ardys
    line(715,204,895,204); //Lucile - Harold
    line(145,219,175,219); //Helen - Roland
    line(115,219,85,248); //Frank - Elmo
    line(1075,223,925,223); //Knoly - Berta
    line(535,248,445,252); //Merna - Larry
    
    //Generation 3 marriages
    line(910,325,925,345); //Merlyn - Vicky
    line(715,350,595,354); //Cherry - Gary
    line(445,359,325,364); //Carol - Dennis
    line(145,359,115,369); //Steve - Jenny
    line(25,359,40,359); //Barbara - Rob
    line(475,364,535,379); //Rick - Nancy
    line(1015,364,1030,403); //Rick - Becky
    line(55,369,70,369); //Pete - Unknown
    line(895,374,745,403); //Bill - Donna
    line(295,374,265,379); //Kathy - Bill
    line(235,379,205,388); //Mike - Nancy
    line(1075,383,1105,383); //Holly - Greg
    
    //Generation 4 marriages
    line(925,432,940,432); //Dawn - Unknown
    line(955,442,970,442); //Denise - Unknown
    line(1015,447,1030,447); //Mike - Unknown
    line(985,456,1000,456); //Renae - Unknown
    line(625,461,655,471); //Brandt - Kelly
    line(1045,466,1075,480); //Brent - Valerie
    line(595,485,565,495); //Mitch - Michel
    line(475,490,445,490); //Sara - Guerin
    line(1105,490,1135,500); //Jeremy - Mi'chelle
    line(535,514,505,514); //Anna - Michael
    line(835,514,805,539); //Abbie - Craig
    line(895,524,865,534); //Mackensie - Seth
    line(685,524,715,529); //Kent - Morgan
  }
  
  void displayDivorces(){
    //Draw a faint red line b/w the xpos,ypos of those who are divorced
    strokeWeight(str); //Strokeweight of 1
    stroke(c,op); //Red color (c), opacity of 150
    
    line(85,248,25,248); //Elmo - John
    line(415,267,430,267); //Myra - Bob
    line(925,345,955,345); //Vicky - Don
    line(1015,364,985,364); //Rick - Terrill
    line(85,383,100,383); //Janet - Unknown
  }
  
  void displayRelations(){
    //Draw white lines with a 1 stroke weight to connect family members
    //The first point (x1,y1) for each line() is the calculated middle of the marriage line b/w the parents
    //The second point (x2,y2) for each line() is the xpos,ypos of the child
    strokeWeight(str); //Strokeweight of 1
    stroke(c2,op); //Color 2 (white) and 150 opacity (op)
    
    //Leslie and Dorothy
    line(160,127,85,248); //To Elmo
    line(160,127,145,219); //To Helen
    line(160,127,235,238); //To Ardy
    
    //Harry and Ally
    line(340,42,325,199); //To Don
    line(340,42,355,180); //To Edward
    
    //Holger and Erma
    line(430,117,415,267); //To Myra
    line(430,117,445,252); //To Larry
    
    //Roy and Mabel
    line(730,68,535,248); //To Merna
    line(730,68,655,189); //To Leona
    line(730,68,895,204); //To Harold
    line(730,68,925,223); //To Berta
    
    //Elmo and John
    line(55,248,25,359); //To Barbara
    line(55,248,55,369); //To Pete
    line(55,248,85,383); //To Janet
    
    //Helen and Roland
    line(160,219,145,359); //To Steve
    line(160,219,175,350); //To Carol
    
    //Ardys and Don
    line(280,219,235,379); //To Mike
    line(280,219,295,374); //To Kathy
    line(280,219,325,364); //To Dennis
    
    //Merna and Larry
    line(490,250,445,359); //To Carol
    line(490,250,535,379); //To Nancy
    
    //Harold and Lucile
    line(805,204,715,350); //To Cherry
    line(805,204,895,374); //To Bill
    
    //Berta and Knoly
    line(1000,223,925,345); //To Vicky
    line(1000,223,1015,364); //To Rick
    line(1000,223,1075,383); //To Holly
    
    //Jenny and Steve
    line(130,364,115,495); //To Abbie
    line(130,364,145,510); //To Kip
    
    //Mike and Nancy
    line(220,384,205,490); //To Patrick
    line(220,384,235,500); //To Dan
    
    //Kathy and Bill
    line(280,377,265,510); //To Katy
    line(280,377,295,490); //To Carey
    
    //Nancy and Rick
    line(505,372,475,490); //To Sara 
    line(505,372,535,514); //To Anna
    
    //Cherry and Gary
    line(655,352,595,485); //To Mitch
    line(655,352,655,471); //To Kelly
    line(655,352,715,529); //To Kent
    
    //Bill and Donna
    line(820,389,745,505); //To Wiley
    line(820,389,775,510); //To Wyatt
    line(820,389,835,514); //To Abbie
    line(820,389,895,524); //To Mackensie
    
    //Vicky and Don
    line(940,345,925,432); //To Dawn
    line(940,345,955,442); //To Denise
    
    //Rick and Terrill
    line(1000,364,1015,447); //To Mike
    line(1000,364,985,456); //To Renae
    
    //Holly and Greg
    line(1090,383,1075,480); //To Valerie
    line(1090,383,1105,490); //To Jeremy
    
    //Patrick
    line(205,528,205,597); //To Patricia
    
    //Sara and Guerin
    line(460,490,445,655); //To Grace
    line(460,490,475,665); //To Scott
    
    //Anna and Michael
    line(520,514,520,665); //To Cooper
    
    //Kelly and Brandt
    line(640,466,625,636); //To Beck
    line(640,466,640,650); //To Cohen
    line(640,466,655,660); //To Cruz
    
    //Mackensie and Seth
    line(880,529,880,665); //To Eliora
    
    //Abbie and Craig
    line(820,527,820,670); //To Liam
    
    //Renae
    line(985,499,965,592); //To Ryan
    line(985,499,985,607); //To Cole
    line(985,499,1005,607); //To Caroline
    
    //Valerie and Brent
    line(1060,473,1045,592); //To Hannah
    line(1060,473,1060,602); //To Kade
    line(1060,473,1075,607); //To Cole
    
    //Jeremy and Michelle
    line(1120,495,1105,626); //To Laney
    line(1120,495,1115,636); //To Brady
    line(1120,495,1125,655); //To Asher
    line(1120,495,1135,660); //To Declan
    
    stroke(c2,op/2); //Color 2 (white) and 75 opacity (op/2)
    //Because I am adopted, and therefore not related by blood with my parents, a fainter white line (opacity 75) connects me to my parents
    //Dennis and Carol
    line(385,362,385,573); //To Jenny
  }
}
class Members { //Variables
  String name; //Family member's name
  String relation; //Family member's relation to the family
  int relation2; //Family member's relation to the family, p1 (Don's family) = 1, p2 (Merna's family) = 2, p3 (Larry's family) = 3, p4 (Ardys' family) = 4, spouse = 5, exspouse = 6, myself = 7
  int b; //Year of birth
  int l; //Is the person still alive, yes or no? Yes = 1, No = 0 
  int d; //Year of Death
  int a; //Current age, or age of death
  String status; //Relationship status
  String spouse; //Spouse's name
  String exspouse; //Ex-spouse's name
  int gen; //Generation 
  int side; //Mother's side of the family (= 2), or father's side of the family (= 1), or neither (= 3)
  int xpos; //x position of the objects
  int ypos; //y position of the objects, calculated from <<int(map(member[i].getB(),1880,2014,25,height-25))>> remapping year of birth (1880-2014) to 25-675 width, map() referenced from processing.org by Ben Fry and Casey Reas
  color c;  //Color of the objects
  
  Members(String line){ //Constructor
    String[] data = line.split(","); //Splits each String (row) by placing commas
    //Credit: Hannah Organick's 2009 Worldwide HIV Statistics Visualization (www.openprocessing.org/sketch/60308)
    //The variables equal the data from the respective columns in the Family_Data.cvs table
    name = data[0]; //Variable name retrieves the values from the 1st column in the table 
    relation = data[1]; //Variable relation retrieves the values from the 2nd column in the table 
    relation2 = int(data[2]); //Converts string[] into int [], variable relation2 retrieves the values from the 3rd column in the table 
    b = int(data[3]); //Converts string[] into int[], variable b retrieves the values from the 4th column in the table 
    l = int(data[4]); //Converts string[] into int[], variable l retrieves the values from the 5th column in the table
    d = int(data[5]); //Converts string[] into int[], variable d retrieves the values from the 6th column in the table
    a = int(data[6]); //Converts string[] into int[], variable a retrieves the values from the 7th column in the table
    status = data[7]; //Variable status retrieves the values from the 8th column in the table
    spouse = data[8]; //Variable spouse retrieves the values from the 9th column in the table
    exspouse = data[9]; //Variable exspouse retrieves the values from the 10th column in the table
    gen = int(data[10]); //Converts string[] into int[], variable gen retrieves the values from the 11th column in the table
    side = int(data[11]); //Converts string[] into int[], variable side retrieves the values from the 12th column in the table
    xpos = int(data[12]); //Converts string[] into int[], variable xpos retrieves the values from the 13th column in the table
    ypos = int(data[13]); //Converts string[] into int[], variable ypos retrieves the values from the 14th column in the table
    
    //If-statements to determine the property needed for a certain color 
    if (gen == 1){ //If generation is 1, than the object color is blue
      c = color(52,143,255); //Blue
    } else if (gen == 2){ //If generation is 2, than the object color is blue-green
      c = color(66,232,229); //Blue-green
    } else if (gen == 3){ //If generation is 3, than the object color is sea-green
      c = color(120,255,170); //Sea-green
    } else if (gen == 4){ //If generation is 4, than the object color is lime green
      c = color(108,232,55); //Lime green
    } else if (gen == 5){ //If generation is 5, than the object color is yellow
      c = color(255,251,1); //Yellow
    } //Colors codes come from the assistance of adobe kuler
  }
  
 void display(){ //Class functions
   if (l == 0){ //If l (alive) is 0 (no), then the stroke weight is 1 and color c has an opacity of 100 - family member has passed 
     strokeWeight(1); //Stroke weight is 1
     stroke(c,100); //Stroke has teh color c and an opacity of 100
   } else { //If l (alive) is 1 (yes), then the stroke weight is 2 and color c has 100% opacity - family member is currently alive
     strokeWeight(2); //Stroke weight is 2
     stroke(c); //Stroke color is color c
   }
   
   if (relation2 == 5 || relation2 == 6 || relation2 == 7){ //If relation2 = 5,6, or 7 (spouse/exspouse/adopted), then family member is represented as an rectangle 
     fill(c,50); //Color c with 50 opacity 
     rectMode(CENTER); //Reactangle mode is CENTER
     rect(xpos,ypos,a/5,a); //Rectangle with y as year of birth, x as the generation, and height/length of rectangle as age
     stroke(c); //Stroke color is color c
     point(xpos,ypos); //Point in the center of the rectangle, where interaction occurs
   } else { //If not a spouse or exspouse, then family memeber is represented as a line
     line(xpos,ypos,xpos,ypos+a); //Line lenth is age, y position is the year of birth, and x position has been calculated by me to give each line the same amount of space from another
     strokeWeight(4); //Stroke weight is 4
     point(xpos,ypos); //Point at the top of the line, where interaction occurs
   }
   
   if (side == 1){ //If family member is from my father's side, then fill a blue ellipse at xpos,ypos
     noStroke(); //No stroke
     fill(0,160,255,50); //Blue color, code comes from the assistance of adobe kuler
     ellipse(xpos,ypos,25,25); //25x25 circle at xpos, ypos
   } else if (side == 2){ // If family member is from my mother's side, then fill a pink rectangle at xpos,ypos
     noStroke(); //No stroke
     fill(255,76,157,50); //Pink color, code comes from the assistance of adobe kuler
     rect(xpos,ypos,25,25); //25x25 square at xpos,ypos
   }
  } 
  
  //Code below based on Hannah Organick's 2009 Worldwide HIV Statistics Visualization (www.openprocessing.org/sketch/60308)
  //These functions allow for calling/retrieving the data in the void draw()
  String getName(){
   return name;
  } //Returns the family member's name
  String getRelation(){
    return relation;
  } //Returns the family member's relation to the family
  int getB(){
    return b;
  } //returns the year of birth
  int getD(){
    return d;
  } //Returns the year of Death
  int getA(){
    return a;
  } //Returns the current age, or age of death
  String getStatus(){
    return status;
  } //Returns the relationship status
  String getSpouse(){
    return spouse;
  } //Returns spouse's name
  String getExspouse(){
    return exspouse;
  } //Returns ex-spouse's name
  int getXpos(){
    return xpos;
  } //Returns xpos
  int getYpos(){
    return ypos;
  } //Returns ypos
  color getC(){
    return c;
  }  //Returns color 
}



