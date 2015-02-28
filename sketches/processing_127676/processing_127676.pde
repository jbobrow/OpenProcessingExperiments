
int dx[] = {
  -1, 0, 1, 0,
}; 
int dy[] = {
  0, 1, 0, -1,
};
int num = 720*5;

int speedup = 3;

int x, y;
boolean primes[];

void setup() {

  size(512, 512);

  background(0);

  loadPixels();
  primes = new boolean[1];

  textFont(loadFont("04b24-8.vlw"));
}


void draw() {

  for (int i = 0 ; i < speedup;i++) {
    primes = expand(primes, primes.length+1);
    primes[primes.length-1] = prime(primes.length);
  }
  background(0);
  loadPixels();

  x = width/2;
  y = height/2;

  float seg = 1;
  int cnt = 0;

loop:
  for (int i = 1; i < primes.length; i+= 1) {

    if ((i)%2==0)
      seg+=1;

    for (int q = 0 ; q <= seg ;q++) {
      boolean isPrime = primes[abs(cnt+primes.length-(int)((sin(frameCount/500.0)+1.0)*800.0))%primes.length ];
      color c = color(isPrime?#ffffff:#000000);
      x += dx[ (int)(i) % (dx.length) ];
      y += dy[ (int)(i) % (dy.length) ];

      //if(isPrime && (cnt)%((int)(frameCount/20.0)+1)!=0)
      //c = color(#ff0000);

      //  if(primes[(cnt)%primes.length ]){
      set(x, y, c);


      cnt++;

      if (cnt>=primes.length)
        break loop;
    }
  }

  fill(255);
  textAlign(CENTER);
  text("ULAM's", width/2+2, height/2-seg/2);
  
  text(primes.length, width/2+2, height/2+seg/2+8);
}


boolean primes(int n)[] {
  boolean tmp[] = new boolean[n+1];
  for (int i = 1; i <= n; i++) {
    int c = 0;
test:
    for (int j = 1 ; j <= i; j++) {
      if (i%j==0)
        c++;

      if (c>2)
        break test;
    }

    tmp[i] = (c==2) ? true : false;
  }
  return tmp;
}


boolean prime(int n) {
  boolean tmp = false;

  int c = 0;

test:
  for (int j = 1 ; j <= n; j++) {
    if (n%j==0)
      c++;

    if (c>2)
      break test;
  }

  tmp = (c==2) ? true : false;



  return tmp;
}


