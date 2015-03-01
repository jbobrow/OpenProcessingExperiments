

PFont titleFont, labelFont, keyFont;

String[] Revenue = {"TFA", "DC", "R2R", "POP"};
int[] Donations = {72, 99, 97, 99};
int[] Grants = {21, 0, 1, 0};
int[] Investments = {6, 1, 1, 0};
int[] Other = {1, 0, 1, 1};

String[] Expenses = {"TFA", "DC", "R2R", "POP"};
int[] Program = {75, 94, 83, 81};
int[] General = {14, 2, 6, 8};
int[] Fundraising = {11, 4, 11, 11};

String[] DonationAmt = {"140 million", "53 million", "46 million", "5 million"};
int[] DonationRadius = {300, 106, 92, 10};


void setup() {
  size(900, 900);
  background(#E6F2C0);
  titleFont = createFont("Avenir", 24);
  labelFont = createFont("Avenir", 12);
  keyFont = createFont("Avenir", 10);
  smooth();
  rectMode(CENTER);
  
  int bb = 100; //bottom border
  int lb = 175; //left border
    //y axis 
  stroke(#404041);
  for (int i = 0; i < 35; i+=7){
    int y = height - 110 - i * 21;
    line(lb - 65, height - bb, lb - 65, y);
   line(lb - 60, y, lb - 70, y);
  } 
  
  //text
   noStroke();
   
    textFont(titleFont);
    textAlign(CENTER);
    fill(#404041);
    text("2013 Financial Reports", 450, height - 800);
    
    textFont(labelFont);
    textAlign(CENTER);
    fill(#404041);
    text("Revenue & Expenses, as a % of Total Budget", 450, height - 780);
   
    textFont(keyFont);
    textAlign(RIGHT);
    fill(#404041);
    text("0%", lb - 75, height-bb);
    text("25%", lb - 75, height- 250);
    text("50%", lb - 75, height- 400);
    text("75%", lb - 75, height- 550);
    text("100%", lb - 75, height - 695);
    
    textFont(labelFont);
    text("Teach for America", 250, height - 80);
    text("DonorsChoose.org", 405, height - 80);
    text("Room to Read", 540, height - 80);
    text("Pencils of Promise", 702, height - 80);
    //key text revenue
    text("Revenue", 800, height - 690);
    //fill(#F4CF5D);
    text("Fundraising", 832, height - 665);
    //fill(#EEAA2E);
    text("Grants", 805, height - 645);
    //fill(#F79344);
    text("Investments", 835, height - 625);
    //fill(#CE7338);
    text("Other", 802, height - 605); 
    //key text expenses
    text("Expenses", 800, height - 560);
    //fill(#A9D387);
    text("Program", 815, height - 535);
    //fill(#6CA579);
    text("General", 815, height - 515);
    //fill(#517758);
    text("Fundraising", 832, height - 495);
}



void draw() {
  noStroke();
  
  //key - Revenue
  fill(#F4CF5D);
  rect(760, height - 670, 10, 10);
  fill(#EEAA2E);
  rect(760, height - 650, 10, 10);
  fill(#F79344);
  rect(760, height - 630, 10, 10);
  fill(#CE7338);
  rect(760, height - 610, 10, 10);
  //key-expenses
  fill(#A9D387);
  rect(760, height - 540, 10, 10);
  fill(#6CA579);
  rect(760, height - 520, 10, 10);
  fill(#517758);
  rect(760, height - 500, 10, 10);
  
  //key - Expenses
  
  int bb = 100; //bottom border
  int lb = 175; //left border
  
//REVENUE
  for(int i = 0; i < Revenue.length; i++) {
    int w = 50; //width of bars
    int s = 50; //space between bars
   
    fill(#F4CF5D);
    int[] d = new int[Revenue.length]; //tall for bars
    d[i] = Donations[i] * 6;
    int[] dx = new int[Revenue.length]; //x axis
    dx[i] = int(lb + i * (w + (2* s))); 
    int[] dy = new int[Revenue.length]; //y axis
    dy[i] = height - bb - d[i]/2;
  
  rect(dx[i], dy[i], w, d[i]);

   fill(#EEAA2E);
    int[] g = new int[Revenue.length];
    g[i] = Grants[i] * 6;
    
    int[] gx = new int[Revenue.length]; 
    gx[i] = int(lb + i * (w + (2*s))); 
    int[] gy = new int[Revenue.length]; 
    gy[i] = height - bb - d[i] - g[i]/2;
 
   rect(gx[i], gy[i], w, g[i]);
   
  fill(#F79344);
    int[] v = new int[Revenue.length];
    v[i] = Investments[i] * 6;
    
    int[] vx = new int[Revenue.length]; 
    vx[i] = int(lb + i * (w + (2*s))); 
    int[] vy = new int[Revenue.length]; 
    vy[i] = height - bb - g[i] - d[i] - v[i]/2;
  
  rect(vx[i], vy[i], w, v[i]);
  
     fill(#CE7338);
    int[] o = new int[Revenue.length];
    o[i] = Other[i] * 6;
    
    int[] ox = new int[Revenue.length]; 
    ox[i] = int(lb + i * (w + (2*s))); 
    int[] oy = new int[Revenue.length]; 
    oy[i] = height - bb - d[i] - g[i] - v[i] - o[i]/2;
  
  rect(ox[i], oy[i], w, o[i]);


//EXPENSES

   fill(#A9D387);
    int[] p = new int[Expenses.length]; //tall for bars
    p[i] = Program[i] * 6;
    int[] px = new int[Expenses.length]; //x axis
    px[i] = dx[i] + w + 5; 
    int[] py = new int[Expenses.length]; //y axis
    py[i] = height - bb - p[i]/2;
  
  rect(px[i], py[i], w, p[i]);
  

   fill(#6CA579);
    int[] n = new int[Expenses.length]; //tall for bars
    n[i] = General[i] * 6;
    int[] nx = new int[Expenses.length]; //x axis
    nx[i] = dx[i] + w + 5; 
    int[] ny = new int[Revenue.length]; //y axis
    ny[i] = height - bb - p[i] - n[i]/2;
  
  rect(nx[i], ny[i], w, n[i]);
  
     fill(#517758);
    int[] f = new int[Expenses.length]; //tall for bars
    f[i] = Fundraising[i] * 6;
    int[] fx = new int[Expenses.length]; //x axis
    fx[i] = dx[i] + w + 5; 
    int[] fy = new int[Revenue.length]; //y axis
    fy[i] = height - bb - p[i] - n[i] - f[i]/2;
  
  rect(fx[i], fy[i], w, f[i]);
}


}

