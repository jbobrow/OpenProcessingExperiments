
Human humans[] = new Human[4];
int timer;
int year=1985;

void setup() {
  size(1000, 600);
  // passed in parameters: position x, position y, --and the rest are the hard coded data, like: obesity in 1960, obesity in 1961, obesity in 1962....add more
  humans[0] = new Human(200, height/2, 0.5, 0.5, .5, 1, .5, .5, 1, 1, 1, 1, 1, 1, 1.7, 1.7, 1.7, 1.7, 2.3, 1.7, 2.3, 2.3, 2.3, 2.3, 2.3, 2.3, 2.3, 2.3); //california
  humans[1] = new Human(400, height/2, 0.2, 0.2, 1, .5, 1, 1, 1, 1, 1, 1.7, 1.7, 1.7, 1.7, 1.7, 2.3, 2.3, 2.3, 2.3, 2.3, 2.7, 2.7, 2.7, 2.7, 2.7, 2.7, 3.3); //texas
  humans[2] = new Human(600, height/2, 0.2, 0.2, 0.2, 0.2, 0.2, 1, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 2.3, 2.3, 2.3, 2.3, 2.7, 2.7, 2.7, 2.7, 3.3, 3.3, 3.3, 3.3, 3.3, 3.3); //mississippi
  humans[3] = new Human(800, height/2, 0.2, 0.2, 0.2, 0.2, 0.2, .5, .5, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 2.3 ); //colorado
  timer = 0;
}

void draw() {
  background(255);
  timer++;
  if (timer % 40 == 0) {
    year++;
    if (year>2010) {
      year = 1985;
    }
    
    
    for (int i=0;i<humans.length;i++) {
      humans[i].changeAmount();
      
    }
  }
  for (int j=0;j<humans.length;j++) {
    humans[j].display();
  }
  
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text(year,width/2,height/4+23);
}

class Human {
  int x;
  int y;
  float amount[] = new float[26];
  int currentIndex = 0;

  // x, y, ---and hard coded data.  You will have many more..
  Human(int _x, int _y, float _0, float _1, float _2, float _3, float _4, float _5, float _6, float _7, float _8, float _9, float _10, float _11,  float _12,  float _13,  float _14, float _15, float _16, float _17, float _18, float _19, float _20, float _21, float _22, float _23, float _24, float _25) {
    x = _x;
    y = _y;
    amount[0] = _0;
    amount[1] = _1;
    amount[2] = _2;
    amount[3] = _3;
    amount[4] = _4;
    amount[5] = _5;
    amount[6] = _6;
    amount[7] = _7;
    amount[8] = _8;
    amount[9] = _9;
    amount[10] = _10;
    amount[11] = _11;
    amount[12] = _12;
    amount[13] = _13;
    amount[14] = _14;
    amount[15] = _15;
    amount[16] = _16;
    amount[17] = _17;
    amount[18] = _18;
    amount[19] = _19;
    amount[20] = _20;
    amount[21] = _21;
    amount[22] = _22;    
    amount[23] = _23;
    amount[24] = _24;
    amount[25] = _25;
  }
  void changeAmount() {
    currentIndex++;
    if (currentIndex >= amount.length) { // we've gone through all the index.  Start back at beginning
      currentIndex = 0;
      background(0,0,0); //flash red.  Just to let us know that we restarted
      
  }
  }
  void display() {
    float tall = int(amount[currentIndex]* 40); // access the array.  What is the current value to present?  Also multiply it, to make it bigger
    color fillColor = color(30,30,255);
    color headColor = color(30,30,225);
    
    //title
         textAlign(CENTER);
         fill(0);
         textSize(20);
         text("PERCENT OF OBESE ADULTS IN ...", width/2, height/4);  
          
  if(x==200){
    fillColor = color(14, 171,216);
        headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(17);
         text("CALIFORNIA", 200, height/2+70);       
}

  if(x==400){
    fillColor = color(207,37,65);
        headColor = color(229,189,162);
     textAlign(CENTER);
         fill(0);
         textSize(17);
         text("TEXAS", 400, height/2+70); 
}
  if(x==600){
    fillColor = color(205, 111,0);
        headColor = color(229,189,162);
     textAlign(CENTER);
         fill(0);
         textSize(17);
         text("MISSISSIPPI", 600, height/2+70);
        
}
    if(x==800){
      fillColor = color(255, 228,0);
        headColor = color(229,189,162);
         textAlign(CENTER);
         fill(0);
         textSize(17);
         text("COLORADO", 800, height/2+70); 
         
      //   if (int(amount[currentIndex])) = .2){
        //   textAlign(CENTER);
         //  fill(0);
         //  textSize(17);
         //  text("no data available", 800, height/2+90);  
           
         //}
}

    noStroke();
    fill(fillColor);
    ellipse(x, y, tall, 50);
    fill(headColor);
    ellipse(x, y-37, 25, 25);
  }
}

//add years, add states, make states more obvious which they are
//different state than texas?


