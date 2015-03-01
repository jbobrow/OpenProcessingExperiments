

PFont titleFont, labelFont, keyFont;

//String[] Revenue = {"Donations", "Grants", "Investments", "Other"};
//int[] R_TFA = {72, 21, 6, 1};

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
  background(#1A1541);
  titleFont = createFont("Avenir", 24);
  labelFont = createFont("Avenir", 12);
  keyFont = createFont("Avenir", 10);
  smooth();
  rectMode(CENTER);
  
  int bb = 100; //bottom border
  int lb = 175; //left border
    //y axis 
  stroke(#FFFFFF);
  for (int i = 0; i < 31; i++){
    int y = height - bb - i * 20;
    line(lb - 65, height - bb, lb - 65, y);
    line(lb - 60, y, lb - 70, y);
  } 
  
  //text
   noStroke();
   
    textFont(titleFont);
    textAlign(CENTER);
    fill(#FFFFFF);
    text("2013 Financial Reports", 450, height - 800);
    
    textFont(labelFont);
    textAlign(CENTER);
    fill(#FFFFFF);
    text("Revenue & Expenses, as a % of Total Budget", 450, height - 780);
   
    textFont(keyFont);
    textAlign(RIGHT);
    fill(#FFFFFF);
    text("0%", lb - 75, height-bb);
    text("25%", lb - 75, height- 250);
    text("50%", lb - 75, height- 400);
    text("75%", lb - 75, height- 550);
    text("100%", lb - 75, height - 700);
    
    textFont(labelFont);
    text("Teach for America", 250, height - 80);
    text("DonorsChoose.org", 405, height - 80);
    text("Room to Read", 540, height - 80);
    text("Pencils of Promise", 702, height - 80);
    //key text revenue
    text("Revenue", 800, height - 690);
    fill(#FFC541);
    text("Fundraising", 832, height - 665);
    fill(#EF5D59);
    text("Grants", 805, height - 645);
    fill(#FF0000);
    text("Investments", 835, height - 625);
    fill(#FFF5C1);
    text("Other", 802, height - 605); 
    //key text expenses
    text("Expenses", 800, height - 560);
    fill(#92278F);
    text("Program", 815, height - 535);
    fill(#0D64EF);
    text("General", 815, height - 515);
    fill(#00A79D);
    text("Fundraising", 832, height - 495);
}



void draw() {
  noStroke();
  
  //key - Revenue
  fill(#FFC541);
  rect(760, height - 670, 10, 10);
  fill(#EF5D59);
  rect(760, height - 650, 10, 10);
  fill(#FF0000);
  rect(760, height - 630, 10, 10);
  fill(#FFF5C1);
  rect(760, height - 610, 10, 10);
  //key-expenses
  fill(#92278F);
  rect(760, height - 540, 10, 10);
  fill(#0D64EF);
  rect(760, height - 520, 10, 10);
  fill(#00A79D);
  rect(760, height - 500, 10, 10);
  
  //key - Expenses
  
  int bb = 100; //bottom border
  int lb = 175; //left border
  
//REVENUE
  for(int i = 0; i < Revenue.length; i++) {
    int w = 50; //width of bars
    int s = 50; //space between bars
   
    fill(#FFC541);
    int[] d = new int[Revenue.length]; //tall for bars
    d[i] = Donations[i] * 6;
    int[] dx = new int[Revenue.length]; //x axis
    dx[i] = int(lb + i * (w + (2* s))); 
    int[] dy = new int[Revenue.length]; //y axis
    dy[i] = height - bb - d[i]/2;
  
  rect(dx[i], dy[i], w, d[i]);
 /*
  if((mouseX > (dx[i] - w/2)) && (mouseX < (dy[i] + w/2)) &&
       (mouseY > (dy[i] - d[i]/2)) && (mouseY < (dy[i] + w/2)) && 
       mousePressed) {
         fill(#FFC541);
        
          int[] d = new int[Revenue.length]; //tall for bars
          d[i] = Donations[i] * 6;
    int[] dx = new int[Revenue.length]; //x axis
    dx[i] = int(lb + i * (w + (2* s))); 
    int[] dy = new int[Revenue.length]; //y axis
    dy[i] = height - bb - d[i]/2;
    
           int[] dr = new int[DonationAmt.length]; 
              dr[i] = DonationRadius[i];
       ellipse(dx[i], dy[i], 2*dr[i], 2*dr[i]);
       fill(#FFFFFF);
       text("Donation Amount", dx[i], dy[i]);
       
 } else  { 
  fill(#FFC541);
  rect(dx[i], dy[i], w, d[i]);
 } 
*/
   fill(#EF5D59);
    int[] g = new int[Revenue.length];
    g[i] = Grants[i] * 6;
    
    int[] gx = new int[Revenue.length]; 
    gx[i] = int(lb + i * (w + (2*s))); 
    int[] gy = new int[Revenue.length]; 
    gy[i] = height - bb - d[i] - g[i]/2;
 
   rect(gx[i], gy[i], w, g[i]);
   
  fill(#FF0000);
    int[] v = new int[Revenue.length];
    v[i] = Investments[i] * 6;
    
    int[] vx = new int[Revenue.length]; 
    vx[i] = int(lb + i * (w + (2*s))); 
    int[] vy = new int[Revenue.length]; 
    vy[i] = height - bb - g[i] - d[i] - v[i]/2;
  
  rect(vx[i], vy[i], w, v[i]);
  
     fill(#FFF5C1);
    int[] o = new int[Revenue.length];
    o[i] = Other[i] * 6;
    
    int[] ox = new int[Revenue.length]; 
    ox[i] = int(lb + i * (w + (2*s))); 
    int[] oy = new int[Revenue.length]; 
    oy[i] = height - bb - d[i] - g[i] - v[i] - o[i]/2;
  
  rect(ox[i], oy[i], w, o[i]);


//INCOME

   fill(#92278F);
    int[] p = new int[Expenses.length]; //tall for bars
    p[i] = Program[i] * 6;
    int[] px = new int[Expenses.length]; //x axis
    px[i] = dx[i] + w + 5; 
    int[] py = new int[Expenses.length]; //y axis
    py[i] = height - bb - p[i]/2;
  
  rect(px[i], py[i], w, p[i]);
  

   fill(#0D64EF);
    int[] n = new int[Expenses.length]; //tall for bars
    n[i] = General[i] * 6;
    int[] nx = new int[Expenses.length]; //x axis
    nx[i] = dx[i] + w + 5; 
    int[] ny = new int[Revenue.length]; //y axis
    ny[i] = height - bb - p[i] - n[i]/2;
  
  rect(nx[i], ny[i], w, n[i]);
  
     fill(#00A79D);
    int[] f = new int[Expenses.length]; //tall for bars
    f[i] = Fundraising[i] * 6;
    int[] fx = new int[Expenses.length]; //x axis
    fx[i] = dx[i] + w + 5; 
    int[] fy = new int[Revenue.length]; //y axis
    fy[i] = height - bb - p[i] - n[i] - f[i]/2;
  
  rect(fx[i], fy[i], w, f[i]);
}


}

