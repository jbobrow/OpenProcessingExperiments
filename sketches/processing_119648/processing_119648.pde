
color[] calder = {#343434, #0f4993, #f4d701, #cc1728};

//import ddf.minim.*;
//import ddf.minim.signals.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;
//
//Minim minim;
//AudioPlayer audioPlayer;

void setup(){
  size(900, 420);
  smooth();
  background(255);
  frameRate(3);
//  minim = new Minim(this);
//  audioPlayer = minim.loadFile("logosound.mp3");
//  audioPlayer.loop();
}

void draw(){
  stroke(255);
  fill(255);
  rect(0,0,900,420);
  
  int a = 60;
  stroke(150);
  strokeWeight(10);
  point(a+150,a);
  point(a+150,a*2);
  point(a+150,a*3);
  point(a+150,a*4);
  point(a+150,a*5);
  point(a+150,a*6);
  point(a*2+150,a);
  point(a*3+150,a);
  point(a*4+150,a);
  point(a*6+150,a);
  point(a*7+150,a);
  point(a*8+150,a);
  point(a*9+150,a);
  point(a*2+150,a*6);
  point(a*3+150,a*6);
  point(a*4+150,a*6);
  point(a*6+150,a*6);
  point(a*7+150,a*6);
  point(a*8+150,a*6);
  point(a*9+150,a*6);
  point(a*6+150,a*2);
  point(a*6+150,a*3);
  point(a*6+150,a*4);
  point(a*6+150,a*5);
  point(a*6+150,a*6);
  point(a*9+150,a*5);
  point(a*9+150,a*4);
  point(a*8+150,a*4);

 
  int[][] g = {{a+150,a},
               {a+150,a*2},
               {a+150,a*3},
               {a+150,a*4},
               {a+150,a*5},
               {a+150,a*6},
               {a*2+150,a},
               {a*3+150,a},
               {a*4+150,a},
               {a*6+150,a},
               {a*7+150,a},
               {a*8+150,a},
               {a*9+150,a},
               {a*2+150,a*6},
               {a*3+150,a*6},
               {a*4+150,a*6},
               {a*6+150,a*6},
               {a*7+150,a*6},
               {a*8+150,a*6},
               {a*9+150,a*6},
               {a*6+150,a*2},
               {a*6+150,a*3},
               {a*6+150,a*4},
               {a*6+150,a*5},
               {a*6+150,a*6},
               {a*9+150,a*5},
               {a*9+150,a*4},
               {a*8+150,a*4},
             };
  
//  import java.util.*;
//  Integer[] x = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27};
//  Collections.shuffle(Arrays.asList(x));
  
  int[] y = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27};
  int[] x = new int[y.length];
  int i=0;
  while ( y.length > 0 )
  {
    int rnd = int(random(y.length));
    x[i] = y[rnd];
    i++;
    if ( rnd > 0 && rnd < y.length-1 )
    y = concat(subset(y,0,rnd), subset(y,rnd+1,y.length-rnd-1));
    else if ( rnd == 0 )
    y = subset(y,1,y.length-1);
    else
    y = shorten( y );
  }

  int h = x[1];
  int i = x[3];
  int j = x[5];
  int k = x[7];
  int l = x[9];
  int m = x[11];
  int n = x[13];
  int o = x[15];
  int p = x[17];
  int q = x[19];
  int r = x[21];
  int s = x[23];
  int t = x[25];
  int u = x[27];
  
  int v = x[2];
  int w = x[4];
  int b = x[6];
  int c = x[8];
  int d = x[10];
  int e = x[12];
  int f = x[14];
  
  strokeWeight(6);
  noFill();
  
  stroke(calder[int(random(0,4))]);
  beginShape();
  curveVertex(g[h][0],g[h][1]);
  curveVertex(g[h][0],g[h][1]);
  curveVertex(g[i][0],g[i][1]);
  curveVertex(g[j][0],g[j][1]);
  curveVertex(g[j][0],g[j][1]);
  endShape();
  
  stroke(calder[int(random(0,4))]);
  line(g[j][0],g[j][1],g[k][0],g[k][1]);
  
  stroke(calder[int(random(0,4))]);
  beginShape();
  curveVertex(g[k][0],g[k][1]);
  curveVertex(g[k][0],g[k][1]);
  curveVertex(g[l][0],g[l][1]);
  curveVertex(g[m][0],g[m][1]);
  curveVertex(g[m][0],g[m][1]);
  endShape();
  
  stroke(calder[int(random(0,4))]);
  line(g[m][0],g[m][1],g[n][0],g[n][1]);
  
  stroke(calder[int(random(0,4))]);
  line(g[n][0],g[n][1],g[o][0],g[o][1]);
  
  stroke(calder[int(random(0,4))]);
  beginShape();
  curveVertex(g[o][0],g[o][1]);
  curveVertex(g[o][0],g[o][1]);
  curveVertex(g[p][0],g[p][1]);
  curveVertex(g[q][0],g[q][1]);
  curveVertex(g[q][0],g[q][1]);
  endShape();
  
  stroke(calder[int(random(0,4))]);
  line(g[q][0],g[q][1],g[r][0],g[r][1]);
  
  stroke(calder[int(random(0,4))]);
  line(g[r][0],g[r][1],g[s][0],g[s][1]);
  
  stroke(calder[int(random(0,4))]);
  beginShape();
  curveVertex(g[s][0],g[s][1]);
  curveVertex(g[s][0],g[s][1]);
  curveVertex(g[t][0],g[t][1]);
  curveVertex(g[u][0],g[u][1]);
  curveVertex(g[u][0],g[u][1]);
  endShape();
  
//  line(g[s][0],g[s][1],g[t][0],g[t][1]);
//  beginShape();
//  curveVertex(g[t][0],g[t][1]);
//  curveVertex(g[t][0],g[t][1]);
//  curveVertex(g[u][0],g[u][1]);
//  curveVertex(g[v][0],g[v][1]);
//  curveVertex(g[v][0],g[v][1]);
//  endShape();
//  line(g[t][0],g[t][1],g[u][0],g[u][1]);
//  line(g[u][0],g[u][1],g[v][0],g[v][1]);  
//  line(g[v][0],g[v][1],g[w][0],g[w][1]);
//  line(g[w][0],g[w][1],g[b][0],g[b][1]);
//  line(g[b][0],g[b][1],g[c][0],g[c][1]);
//  line(g[c][0],g[c][1],g[d][0],g[d][1]);
//  line(g[d][0],g[d][1],g[e][0],g[e][1]);
//  line(g[e][0],g[e][1],g[f][0],g[f][1]); 

//if (millis() >= startTime + timeBetweenAnimationFrames) 
//  {
//    frame = (frame+1) % numFrames;  // Use % to cycle through frames
//    image(images[frame], 50, 50);
//    startTime = millis();
//  }
  
}
