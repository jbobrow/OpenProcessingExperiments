
import processing.opengl.*;

// declare object arrays
Friend[] friends = new Friend[43];
About [] abouts = new About[43];

// initialize constants
float thumbW = 60; // thumbnail width
float fullW = 350; // full image width
float damping = 0.1; // damping to make the transitions look more natural
float speed = 0.002;
float selectedRadius = 300;
boolean isSelected = false;
PFont caption;


void setup() {
  size(1024, 768, OPENGL);
  frameRate(60);
  smooth();
  
  caption = loadFont("GothamRounded-Light-48.vlw");

  // About(String name_, String howMet_, String major_) {
  abouts[0] = new About("Almeera Anwar", "Lander", "Journalism, Anthropology");
  abouts[1] = new About("Elise Becker", "Soccer", "Biology");
  abouts[2] = new About("Benji Grigg", "Random", "Biochemistry");
  abouts[3] = new About("Corbin Williams", "Random", "Civil Engineering");
  abouts[4] = new About("Daniel Baral", "Random", " Mechanical Engineering");
  abouts[5] = new About("Desiree Jones", "Grade School", "Drama, Communications");
  abouts[6] = new About("Ellen Peterson", "Design", "Visual Communication Design");
  abouts[7] = new About("Emily Mitch", "Random", "Early Childhood Development");
  abouts[8] = new About("Erin Hobbs", "Fig and Orientation", "Communications");
  abouts[9] = new About("Felix Wang", "Design", "Visual Communication Design");
  abouts[10] = new About("Graham Cooper", "Sister's Boyfriend", "Industrial Design");
  abouts[11] = new About("Hannah Majeski", "Friend of Friend", "Biology"); 
  abouts[12] = new About("Hannah Pederson", "Design", "Visual Communication Design");
  abouts[13] = new About("Ishita Mitra", "Lander", "Psychology, Communications");
  abouts[14] = new About("Jacquelyn Edwards", "Design", "Visual Communication Design");
  abouts[15] = new About("Jessie Naluai", "Lander", "Spanish");
  abouts[16] = new About("Josh Domingo", "High School", "CSE");
  abouts[17] = new About("Julia Lattimer", "Fig", "Sociology");
  abouts[18] = new About("Justin Coleman", "Lander", "Business");
  abouts[19] = new About("Kelsey Hirsch", "Soccer", "Nursing");
  abouts[20] = new About("Kinsey Gross", "Design", "Visual Communication Design");
  abouts[21] = new About("Luke Ailanjian", "Lander", "Political Science");
  abouts[22] = new About("Luke Larson", "Soccer", "PreMed");
  abouts[23] = new About("Maggie Bissel", "Lander", "Geography");// 
  abouts[24] = new About("James Atkins", "Design", "Visual Communication Design"); 
  abouts[25] = new About("Michelle Halpin", "Work", "Bio Engineering");
  abouts[26] = new About("Claire Wolf", "Rome", "Interaction Design"); // switched
  abouts[27] = new About("Nicole Yeo", "Orientation", "Visual Communication Design");
  abouts[28] = new About("Nikita Nana", "Lander", "Communication");
  abouts[29] = new About("Olivia Lopez", "Lander", "Sociology");
  abouts[30] = new About("Pearl Whirly", "Friend of Friend", "English");
  abouts[31] = new About("Preet Brar", "Lander", "Biology");
  abouts[32] = new About("Rebecca Morse", "Fig", "Chid");
  abouts[33] = new About("Renee Plummer", "Lander", "Biology");
  abouts[34] = new About("Riley Houk", "Lander", "Early Childhood Development"); 
  abouts[35] = new About("Robbie Sepler", "Lander", "International Studies");
  abouts[36] = new About("Stephanie Hughes", "Sister", "Visual Communication Design");
  abouts[37] = new About("Stephen Erickson", "Lander", "Environmental Studies");
  abouts[38] = new About("Tim Murphy", "Lander", "Political Science, Communication");
  abouts[39] = new About("Whitney Garrett", "Friend of Friend", "Spanish"); 
  abouts[40] = new About("Carly Henley", "Soccer", "Music, Communication");
  abouts[41] = new About("Michelle McArdel", "Orientation", "Visual Communication Design");
  abouts[42] = new About("Pablo Leyva", "Lander", "Sociology");


  
  //  Friend(int yearMet_, int[] relations_, String url_, float thumbWidth_, float fullWidth_, float x_, float y_) {
  friends[0] = new Friend(2008, new int[] { 1,2,3,4,5,6,15,17,28,29,31,33,34,35,38,39 }, "almeera_thumb.png", abouts [0], thumbW, fullW, width/2, height/2); // pass in the indeces of related friends
  friends[1] = new Friend(2001, new int[] { 0,3,4,5,9,12,15,17,19,21,22,23,30,31,33,34,35,36,37,38,41 }, "elise_thumb.png", abouts [1],thumbW, fullW, width/2, height/2);
  friends[2] = new Friend(2008, new int[] { 0,5,7,13,17,23,27,28,29,31,34,36,40}, "benji_thumb.png",abouts [2], thumbW, fullW, width/2, height/2);
  friends[3] = new Friend(2008, new int[] { 0,1,4,5,6,7,11,12,15,17,21,25,29,30,31,33,34,35,36,37,38,39,41}, "corbin_thumb.png", abouts [3],thumbW, fullW, width/2, height/2);
  friends[4] = new Friend(2008, new int[] { 0,1,3,4,11,15,17,29,31,34,36,38,41 }, "daniel_thumb.png", abouts [4],thumbW, fullW, width/2, height/2);
  friends[5] = new Friend(1995, new int[] { 0,1,2,3,4,8,10,11,13,15,16,17,18,23,25,28,29,30,31,34,35,36,37,38,39,42 }, "desiree_thumb.png", abouts [5], thumbW, fullW, width/2, height/2);
  friends[6] = new Friend(2009, new int[] { 0,3,9,10,12,14,20,24,25,27,31,36,37,41}, "ellen_thumb.png", abouts [6], thumbW, fullW, width/2, height/2);
  friends[7] = new Friend(2010, new int[] { 2,3,17,18,28,29,30,31,33,34,42}, "emily_thumb.png", abouts [7], thumbW, fullW, width/2, height/2);
  friends[8] = new Friend(2008, new int[] { 0,5,13,27,28,31,32,34,37,41}, "erin_thumb.png", abouts [8], thumbW, fullW, width/2, height/2);
  friends[9] = new Friend(2009, new int[] { 1,6,10,12,14,17,17,20,27,34,36,41}, "felix_thumb.png", abouts [9], thumbW, fullW, width/2, height/2);
  friends[10] = new Friend(2009, new int[] { 5,9,28,29,31,34,36}, "graham_thumb.png", abouts [10], thumbW, fullW, width/2, height/2);
  friends[11] = new Friend(2011, new int[] { 3,4,5,12,17,31,34,38 }, "hannahm_thumb.png", abouts [11], thumbW, fullW, width/2, height/2);
  friends[12] = new Friend(2009, new int[] { 1,6,9,10,14,17,19,20,21,26,24,27,36,38,41 }, "hannahp_thumb.png", abouts [12], thumbW, fullW, width/2, height/2);
  friends[13] = new Friend(2008, new int[] { 0,2,5,8,16,17,18,21,25,28,29,31,33,34,35,36,38,42 }, "ishita_thumb.png", abouts [13], thumbW, fullW, width/2, height/2);
  friends[14] = new Friend(2009, new int[] { 6,9,10,12,17,18,20,24,27,31,34,36,38,41}, "jac_thumb.png", abouts [14], thumbW, fullW, width/2, height/2);
  friends[15] = new Friend(2008, new int[] { 0,1,3,5,17,18,21,22,25,28,31,33,35,38}, "jessie_thumb.png", abouts [15], thumbW, fullW, width/2, height/2);
  friends[16] = new Friend(2004, new int[] { 0,5,13,17,18,28,29,31,36 }, "joshd_thumb.png", abouts [16], thumbW, fullW, width/2, height/2);
  friends[17] = new Friend(2008, new int[] { 0,1,2,3,4,5,7,8,9,10,11,12,13,14,15,17,18,20,21,23,25,27,28,29,30,31,32,33,34,35,36,37,38,39,41,42 }, "julia_thumb.png", abouts [17], thumbW, fullW, width/2, height/2);
  friends[18] = new Friend(2008, new int[] { 5,7,13,14,15,16,17,28,29,34,36,38,42 }, "justin_thumb.png", abouts [18], thumbW, fullW, width/2, height/2);
  friends[19] = new Friend(2010, new int[] { 0,1,2,22,34 }, "kelsey_thumb.png", abouts [19], thumbW, fullW, width/2, height/2);
  friends[20] = new Friend(2009, new int[] { 2,6,9,10,12,14,17,27,36,40,41 }, "kinsey_thumb.png", abouts [20], thumbW, fullW, width/2, height/2);
  friends[21] = new Friend(2008, new int[] { 0,1,3,5,12,13,15,17,23,24,25,28,31,33,34,35,37,38,39 }, "luke_thumb.png", abouts [21], thumbW, fullW, width/2, height/2);
  friends[22] = new Friend(2010, new int[] { 1,15,19,38 }, "lukel_thumb.png", abouts [22], thumbW, fullW, width/2, height/2);
  friends[23] = new Friend(2004, new int[] { 1,2,5,17,30,31,35,37,38,39 }, "maggie_thumb.png", abouts [23], thumbW, fullW, width/2, height/2); 
  friends[24] = new Friend(2008, new int[] { 6,9,12,14,20,21,31,26,27,38,41 }, "james_thumb.png", abouts [24], thumbW, fullW, width/2, height/2); // switched
  friends[25] = new Friend(2011, new int[] { 0,1,3,5,6,7,10,11,13,17,21,29,31,34,35,36,38,39 }, "michelle_thumb.png", abouts [25], thumbW, fullW, width/2, height/2);
  friends[26] = new Friend(2008, new int[] { 12,24,37}, "claire_thumb.png", abouts [26], thumbW, fullW, width/2, height/2); // switched
  friends[27] = new Friend(2008, new int[] { 6,8,9,12,14,17,20,24,26,29,35,36,37,38,41 }, "nicole_thumb.png", abouts [27], thumbW, fullW, width/2, height/2);
  friends[28] = new Friend(2008, new int[] { 0,2,5,8,13,16,17,18,21,33,34,35,38,42}, "nikita_thumb.png", abouts [28], thumbW, fullW, width/2, height/2);
  friends[29] = new Friend(2008, new int[] { 0,3,5,7,10,13,17,18,28,31,33,34,35,36,38,41,42 }, "oly_thumb.png", abouts [29], thumbW, fullW, width/2, height/2);
  friends[30] = new Friend(2009, new int[] { 0,1,3,5,7,11,17,21,23,25,29,31,34,35,37,38}, "pearl_thumb.png", abouts [30], thumbW, fullW, width/2, height/2);
  friends[31] = new Friend(2008, new int[] { 0,1,2,3,4,5,6,7,10,11,13,14,15,16,17,18,21,23,24,25,28,29,30,33,34,35,36,37,38,39,42 }, "preet_thumb.png", abouts [31], thumbW, fullW, width/2, height/2);
  friends[32] = new Friend(2008, new int[] { 8,17,41 }, "rebecca_thumb.png", abouts [32], thumbW, fullW, width/2, height/2);
  friends[33] = new Friend(2008, new int[] { 0,1,3,7,13,15,17,18,25,28,29,31,34,38 }, "renee_thumb.png", abouts [33], thumbW, fullW, width/2, height/2);
  friends[34] = new Friend(2008, new int[] { 0,1,2,3,4,5,7,8,10,11,13,14,16,17,18,20,21,22,25,27,29,30,31,33,34,35,36,38,39,40,41,42 }, "riley_thumb.png", abouts [34], thumbW, fullW, width/2, height/2);
  friends[35] = new Friend(2008, new int[] { 0,1,3,4,5,11,13,15,17,21,25,27,28,29,30,31,33,34,36,37,38,39,41}, "robbie_thumb.png", abouts [35], thumbW, fullW, width/2, height/2);
  friends[36] = new Friend(1989, new int[] { 1,2,3,4,5,9,10,13,14,16,17,18,29,31,34,35,38,40,41 }, "steph_thumb.png", abouts [36], thumbW, fullW, width/2, height/2);
  friends[37] = new Friend(2008, new int[] { 1,3,5,17,21,23,26,31,35,38,39}, "stephen_thumb.png", abouts [37], thumbW, fullW, width/2, height/2);
  friends[38] = new Friend(2008, new int[] { 0,1,3,4,5,8,10,12,13,14,15,17,18,21,22,23,24,25,27,28,29,30,31,33,34,35,36,37,38,39,41 }, "tim_thumb.png", abouts [38], thumbW, fullW, width/2, height/2);
  friends[39] = new Friend(2008, new int[] { 3,5,17,23,29,30,31,34,35,37,38 }, "whitney_thumb.png", abouts [39], thumbW, fullW, width/2, height/2);
  friends[40] = new Friend(2000, new int[] { 2,20,34,36,42 }, "carly_thumb.png", abouts [40], thumbW, fullW, width/2, height/2);
  friends[41] = new Friend(2008, new int[] { 1,3,4,6,8,9,12,14,17,20,24,26,29,32,34,35,36,38 }, "michellem_thumb.png", abouts [41], thumbW, fullW, width/2, height/2);
  friends[42] = new Friend(2008, new int[] { 5,7,13,17,18,28,29,31,34,40 }, "pablo_thumb.png", abouts [42], thumbW, fullW, width/2, height/2);

    //draw bg of title page
    background (70,200,200);
    
    // draw text
    fill(0);
    textFont(caption);
    textSize(24);
    textAlign (CENTER);
    text("Friends Collection", width/2, height/2);
    textSize (16);
    text ("a collection by Tracy Hughes",width/2, height/2+20);
    
  // LOAD AND POSITION IMAGES
  for (int i = 0; i < friends.length; i++) {
    
    // POSITITION IMAGES RANDOMLY
    float posX = width * noise(friends[i].xt);
    float posY = height * noise(friends[i].yt);
    
    friends[i].load(posX, posY);
    friends[i].stackOrder = i; // set stackOrder variable to determine the order to draw items in
    
  }
}

void draw() {
  background(0);
  
  positionRandom(width/2, height/2, selectedRadius);
  positionRadial(width/2, height/2, selectedRadius);
  drawFriends();
  
  testHover(); // display labels on hover (draw at end of void draw so that they overlay all other content)
 
}

void testHover() {
  for (int i = 0; i < friends.length; i++) {
    
    // test for hover on object
    friends[i].isMouseOver(mouseX, mouseY);
  }

  /*
    sets the opacity for all elements in view.
    in the isSelected view, when hovering over any friend, it causes the zoomed selected friend to dim, so that the label will be visible.
  */
  if (!isSelected) { // set opacity for initial (unselected) view

    for (int i = 0; i < friends.length; i++) {

      if (!friends[i].isHovered) {
        friends[i].endOpacity = 100; // set opacity for default state of thumbnail
      } else {
        friends[i].endOpacity = 255; // set opacity for hover state of thumbnail
      }
    }
  }
  else { // set opacity for selected view
          
    boolean hoverOnAnyObject = false;
    int selectedIndex = -1;
    
    for (int i = 0; i < friends.length; i++) {
      
      // if mouse over any object, set hoverOnAnyObject to true, to dim center image
      if (!friends[i].isHovered) {
        friends[i].endOpacity = 100; // set opacity for default state of thumbnail
      }
      else {
        hoverOnAnyObject = true;
        friends[i].endOpacity = 255; // set opacity for hover state of thumbnail
      }
      
      // get index of selected object
      if (friends[i].isZoomed) {
        selectedIndex = i; 
      }
    }
    
    // set opacity
    if (hoverOnAnyObject) { // an object is hovered over
      friends[selectedIndex].endOpacity = 100;
    }
    else { // no object is hovered over
      friends[selectedIndex].endOpacity = 255;
    }
    
    // DISPLAY LABELS
    for (int i = 0; i < friends.length; i++) {
      if (friends[i].isHovered) {
        friends[i].label.display();
        break; // break loop after first label has been displayed, so that they don't overlap
      }
    }
  }
}

//THIS CONTROLS THE ORBIT OF THE RANDOM CIRLCES!
void positionRandom(float centerX, float centerY, float r) {
  
  // position objects randomly
  for (int i = 0; i < friends.length; i++) { // loop through friends array
    
    if (!friends[i].isRelated) { // position only if NOT selected
      
      float posX;
      float posY;
      
      if (isSelected) { // if an object has been selected, move other objects outside of the center radius
        
        // increment angle 
        friends[i].angle += friends[i].speed; // this makes the friends orbit like a merry go round when not selected
      
        // convert radial to polar coordinates
        float outerRadius = selectedRadius + 100;        
        posX = width/2 + outerRadius * cos(friends[i].angle);
        posY = height/2 + outerRadius * sin(friends[i].angle);
          
      }
      else {
        // if no friend has been selected, scatterplot the friends
        posX = width * noise(friends[i].xt);
        posY = height * noise(friends[i].yt);
        
        // increment timers
        friends[i].xt += speed;
        friends[i].yt += speed;
      }
      
      friends[i].position(posX, posY);
    }
  }
}

void drawFriends() {
  
  // draw photos in stack order
  int stackIndex = 0;
  while (stackIndex < friends.length) {
         
    // loop through photos to check for corresponding stackOrder index
    for (int i = 0; i < friends.length; i++) {
      
      // check if stackOrder of photo matches current index. if so, draw the photo
      if (friends[i].stackOrder == stackIndex) {          
        friends[i].display();
        break;
      }
    }
    stackIndex++;
  }
}

void positionRadial(float centerX, float centerY, float r) {
  
  // build temporary ArrayList of related friends
  ArrayList related = new ArrayList();
  for (int i = 0; i < friends.length; i++) {
    if (friends[i].isRelated) {
      related.add(friends[i]);
    }
  }
    
  // positioning algorithm
  for (int i = 0; i < related.size(); i++) {
    float angle = radians(360) / related.size();
    
    // convert radial to polar coordinates
    float posX = centerX + (r - thumbW/2) * cos(angle * i);
    float posY = centerY + (r - thumbW/2) * sin(angle * i);
    
    Friend friend = (Friend) related.get(i); // extract object from ArrayList
    friend.position(posX, posY);
  }
  
}

// test whether mouse clicked and zoom in to full object image
void mousePressed() {  
    
  // loop from the previous index position to length of array - 2, and update stackOrder variable for each photo in that range
  int stackIndex = friends.length-1;
  while (stackIndex >= 0) {
    
    // loop through photos to get corresponding index
    for (int i = 0; i < friends.length; i++) {
      
      if (friends[i].stackOrder == stackIndex) { // check if current object matches the current stack index
        
        if (friends[i].isMouseDown(mouseX, mouseY)) { // checks if mouse button pressed, and if so assign isZoomed to true
          
          // set isSelected to false up-front, to clear the selected state if no object has been selected
          isSelected = false; //global view toggle

          // first, set all relations to false
          for (int n = 0; n < friends.length; n++) {
            friends[n].isRelated = false;
            friends[n].isHovered = false;
          }
          
          if (friends[i].isZoomed) { // checks to see if photo is set to zoom-in    
            
            // set selected state to true
            isSelected = true;
            
            // NOTE: temporarily randomize relations, but this should be hard-coded via your data model!
            int relatedFriends = (int) random(10);
            for(int j = 0; j < friends[i].relations.length; j++) {
           // for (int n = 0; n < relatedFriends; n++) {
              
              // CHOOSE FRIENDS WHO KNOW WHO
              //int index = -1;
              int index = friends[i].relations[j];
              while ((index < 0) || (friends[index].isRelated) || (index == i)) {
                index = (int) random(friends.length);
                
              }
              friends[index].isRelated = true;
              friends[index].isHovered = true;
            }
            // END RANDOM FUNCTION
           
            
            changeStackOrder(i); // if so, change the stack order to put the selected photo in front of all the others
          }
          
          stackIndex = 0; // set stackIndex to zero to exit the while look
          break; // break the for loop, so that no other hit tests fire on objects below the selected object
        }
      }
    }
    stackIndex--;
  }
}

void changeStackOrder(int selectedPhotoIndex) {
    
    /*
      update stack order to move selected item to the top of the drawing stack.
      this includes changing the stackOrder variable for the selected photo, and updating all photos to close the gap in the stack order
    */
    int prevIndex = friends[selectedPhotoIndex].stackOrder; // first, get old index

    // loop from the previous index position to length of array - 2, and update stackOrder variable for each photo in that range
    int stackIndex = prevIndex;
    while (stackIndex < friends.length - 1) {
      
      // loop through photos to get corresponding index
      for (int i = 0; i < friends.length; i++) {
        if (friends[i].stackOrder == stackIndex + 1) {
          
          friends[i].stackOrder = stackIndex; // set stack order to previous index in the array to shuffle array objects.
          friends[i].isZoomed = false; // zoom out of other photos
          break;
        }
      }
      
      stackIndex++;
    }
    
    // set stack index for selected photo to length of array
    friends[selectedPhotoIndex].stackOrder = friends.length - 1;
}

