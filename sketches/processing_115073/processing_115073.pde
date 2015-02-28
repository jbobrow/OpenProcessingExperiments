
void setup(){
  size(670, 420);
  smooth();
  background(255);
  frameRate(0.5);
}

void draw(){
  stroke(255);
  fill(255);
  rect(0,0,670,420);
  
  int a = 60;
  stroke(140);
  strokeWeight(11);
  point(a+35,a);
  point(a+35,a*2);
  point(a+35,a*3);
  point(a+35,a*4);
  point(a+35,a*5);
  point(a+35,a*6);
  point(a*2+35,a);
  point(a*3+35,a);
  point(a*4+35,a);
  point(a*6+35,a);
  point(a*7+35,a);
  point(a*8+35,a);
  point(a*9+35,a);
  point(a*2+35,a*6);
  point(a*3+35,a*6);
  point(a*4+35,a*6);
  point(a*6+35,a*6);
  point(a*7+35,a*6);
  point(a*8+35,a*6);
  point(a*9+35,a*6);
  point(a*6+35,a*2);
  point(a*6+35,a*3);
  point(a*6+35,a*4);
  point(a*6+35,a*5);
  point(a*6+35,a*6);
  point(a*9+35,a*5);
  point(a*9+35,a*4);
  point(a*8+35,a*4);

 
  int[][] g = {{a+35,a},
               {a+35,a*2},
               {a+35,a*3},
               {a+35,a*4},
               {a+35,a*5},
               {a+35,a*6},
               {a*2+35,a},
               {a*3+35,a},
               {a*4+35,a},
               {a*6+35,a},
               {a*7+35,a},
               {a*8+35,a},
               {a*9+35,a},
               {a*2+35,a*6},
               {a*3+35,a*6},
               {a*4+35,a*6},
               {a*6+35,a*6},
               {a*7+35,a*6},
               {a*8+35,a*6},
               {a*9+35,a*6},
               {a*6+35,a*2},
               {a*6+35,a*3},
               {a*6+35,a*4},
               {a*6+35,a*5},
               {a*6+35,a*6},
               {a*9+35,a*5},
               {a*9+35,a*4},
               {a*8+35,a*4},
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
  
  stroke(0);
  strokeWeight(1.5);
  line(g[h][0],g[h][1],g[i][0],g[i][1]);
  line(g[i][0],g[i][1],g[j][0],g[j][1]);
  line(g[j][0],g[j][1],g[k][0],g[k][1]);
  line(g[k][0],g[k][1],g[l][0],g[l][1]);
  line(g[l][0],g[l][1],g[m][0],g[m][1]);
  line(g[m][0],g[m][1],g[n][0],g[n][1]);
  line(g[n][0],g[n][1],g[o][0],g[o][1]);
  line(g[o][0],g[o][1],g[p][0],g[p][1]);
  line(g[p][0],g[p][1],g[q][0],g[q][1]);
  // line(g[q][0],g[q][1],g[r][0],g[r][1]);
  
  int a = 60;
  stroke(140);
  strokeWeight(11);
  point(a+35,a);
  point(a+35,a*2);
  point(a+35,a*3);
  point(a+35,a*4);
  point(a+35,a*5);
  point(a+35,a*6);
  point(a*2+35,a);
  point(a*3+35,a);
  point(a*4+35,a);
  point(a*6+35,a);
  point(a*7+35,a);
  point(a*8+35,a);
  point(a*9+35,a);
  point(a*2+35,a*6);
  point(a*3+35,a*6);
  point(a*4+35,a*6);
  point(a*6+35,a*6);
  point(a*7+35,a*6);
  point(a*8+35,a*6);
  point(a*9+35,a*6);
  point(a*6+35,a*2);
  point(a*6+35,a*3);
  point(a*6+35,a*4);
  point(a*6+35,a*5);
  point(a*6+35,a*6);
  point(a*9+35,a*5);
  point(a*9+35,a*4);
  point(a*8+35,a*4);
  
}
