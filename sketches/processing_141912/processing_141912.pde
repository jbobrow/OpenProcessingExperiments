
//-----------------------------
//  alter these only!
//-----------------------------
int tracks = 5;    //  max 15
int wagons = 7;    //  max 15
//-----------------------------
//  don't change anything else
//-----------------------------
int trackholds;
int tracklen;
int trackgap = 40;
int trackwide = 12;

int wagonwide = 32;
int wagonlong = 46;
int wagonspace = 8;
int wagongap = wagonlong + wagonspace;
int wagonstart = 22;

int travtrack = 0;
int travcont  = 0;
int travlen   = wagonlong + 2*wagonstart;

int[][] sidings;
color[] cc;
int[] ontrack;

int cornerx = 20;
int cornery = 32;

void setup(){
  size(800,400);
  cc = new color[17];
  cc[0]  = #000000;
  cc[1]  = #ff0000;
  cc[2]  = #00ff00;  
  cc[3]  = #0000ff;
  cc[4]  = #ffff00;
  cc[5]  = #00ffff;
  cc[6]  = #ff00ff;
  cc[7]  = #ff6600;
  cc[8]  = #996600;
  cc[9]  = #009900;
  cc[10] = #9966ff;
  cc[11] = #99ffff;
  cc[12] = #ff99ff;
  cc[13] = #ffcc00;
  cc[14] = #333333;
  cc[15] = #999999;
  cc[16] = #ffffff;
  //  create random wagons on tracks
  int big = tracks*wagons;
  int[] dump = new int[big];
  trackholds = ceil(float(big)/(tracks-1));
  tracklen = trackholds*wagongap + 2*wagonstart - wagonspace;
  sidings = new int[tracks][trackholds];
  ontrack = new int[tracks];
  
  for (int i=0;i<big;i++){
    dump[i] = i%tracks + 1;
  }
  for (int i=0;i<10000;i++){
    int a = int(random(big));
    int b = int(random(big));
    int c= dump[a];
    dump[a] = dump[b];
    dump[b] = c;
  }
//  println("tracklen = "+tracklen);
  for (int t=0;t<tracks;t++){
    for (int w=0;w<trackholds;w++){
      sidings[t][w] = 0;
    }
    for (int w=0;w<wagons;w++){
      sidings[t][w] = dump[t*wagons + w];
    }
    ontrack[t] = wagons;
//    println("siding #"+t);
//    println(sidings[t]);
  }
//  sidings[3][4] = 0;
//  sidings[1][7] = 3;
//  sidings[1][8] = 4;
//  frame.setResizable(true);
 }

void draw(){
  background(255);
  
  //  tracks on sidings
  pushMatrix();
  translate(cornerx,cornery);
  for (int t=0;t<tracks;t++){
    doTrack(tracklen, trackwide);
    translate(0,trackgap);
  }
  popMatrix();

  //  wagons on sidings
  pushMatrix();
  translate(cornerx,cornery);
  for (int t=0;t<tracks;t++){
    for (int w=0;w<trackholds;w++){
      doWagon(sidings[t][w], t, w);
    }
  }
  popMatrix();

  //  traverser frame
  pushMatrix();
  translate(cornerx+tracklen +1,cornery-wagonwide/2-4);
  strokeWeight(1);
  stroke(144,64,0);
  noFill();
  rect(0, 0, travlen+2, tracks*trackgap);
  popMatrix();

  //  traverser track and wagon
  pushMatrix();
  translate(cornerx+tracklen +2,cornery+travtrack*trackgap);
  doTrack(travlen, trackwide);
  translate(wagonstart,0);
  doTravWagon(travcont);
  popMatrix();
}

void keyPressed(){
  if (keyCode==DOWN){
    if (travtrack<(tracks-1)){
      travtrack += 1;
    }
  }
  if (keyCode==UP){
    if (travtrack>0){
      travtrack -= 1;
    }
  }
  if (keyCode==LEFT){
    if (travcont > 0){
      int num = ontrack[travtrack];
      if (num < trackholds){
        sidings[travtrack][num] = travcont;
        travcont = 0;
        ontrack[travtrack] = ++num;
      }
    }
  }
  if (keyCode==RIGHT){
    if (travcont == 0){
      int num = ontrack[travtrack];
      if (num > 0){
        num--;
        travcont = sidings[travtrack][num];
        sidings[travtrack][num] = 0;
        ontrack[travtrack] = num;
      }
    }
  }
}

//------------------------------------------------------------
void doTrack(int l, int w){
  strokeCap(SQUARE);
  strokeWeight(4);
  stroke(144,64,0);
  int p = w/2 +6;
  int k = 9;
  while (k<l){
    line(k,-p,k,p);
    k += 18;
  }
  p -= 6;
  strokeWeight(2);
  stroke(180,180,180);
  line(0,-p,l,-p);
  line(0, p,l, p);
}

void doWagon(int colourno, int trackno, int posn){
  if (colourno>0){
    strokeJoin(MITER);
    strokeWeight(4);
    stroke(0);
    fill(cc[colourno]);
    int x = wagonstart+wagongap*posn;
    int y = trackgap*trackno;
    rect(x, y-wagonwide/2, wagonlong, wagonwide);
  }
}
  
void doTravWagon(int colourno){
  if (colourno>0){
    strokeJoin(MITER);
    strokeWeight(4);
    stroke(0);
    fill(cc[colourno]);
    rect(0, -wagonwide/2, wagonlong, wagonwide);
  }
}
  


