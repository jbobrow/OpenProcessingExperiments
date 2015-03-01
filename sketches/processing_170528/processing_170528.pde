
int N = 20;
float lost_to_space = 0;
int t = 0;

float[] cond_0;
float[] hcap_0;
float[] absp_1;
float[] absp_2;
float[] refl_1;
float[] refl_2;

int[] Mat;
float[] Temp;
float[] heat_inboxes;
float[] refl_dn_1;
float[] refl_dn_2;
float[] refl_up_1;
float[] refl_up_2;

PFont f;

void setup() {
  size(500, 500);
  defineMaterials();
  f = createFont("Arial", 16, true); // Arial, 16 point, anti-aliasing on

  Mat = new int[N];
  Temp = new float[N];
  heat_inboxes = new float[N];
  refl_dn_1 = new float[N];
  refl_up_1 = new float[N];
  refl_dn_2 = new float[N];
  refl_up_2 = new float[N];

  setStructure();
}

void setStructure() {
  Mat[0] = 0;
  Mat[1] = 1;
  for (int a=2; a<N; a++) {
    Mat[a] = 3;
  }
  Mat[N-7] = 5;
  Mat[N-8] = 4;

  for (int a=0; a<N; a++) {
    Temp[a] = 10;
    heat_inboxes[a] = 0;
    refl_dn_1[a] = 0;
    refl_up_1[a] = 0;
    refl_dn_2[a] = 0;
    refl_up_2[a] = 0;
  }
}

void defineMaterials() {
  int m = 7;
  cond_0 = new float[m];  // conductivity
  hcap_0 = new float[m];  // heat capacity
  absp_1 = new float[m];  // shortwave absorption
  absp_2 = new float[m];  // longwave absorption
  refl_1 = new float[m];  // shortwave reflection
  refl_2 = new float[m];  // longwave reflection

  // n=0  // land
  cond_0[0] = 2;
  hcap_0[0] = 5;  // 5
  absp_1[0] = 1;
  absp_2[0] = 1;
  refl_1[0] = 0.2;
  refl_2[0] = 0.2;
  // n=1  // water
  cond_0[1] = 2;
  hcap_0[1] = 8;  // 8
  absp_1[1] = 0.9;
  absp_2[1] = 0.9;
  refl_1[1] = 0.2;
  refl_2[1] = 0.1;
  // n=2
  cond_0[2] = 2;
  hcap_0[2] = 5;
  absp_1[2] = 1;
  absp_2[2] = 1;
  refl_1[2] = 0.8;
  refl_2[2] = 0.7;
  // n=3    // air
  cond_0[3] = 0.5;
  hcap_0[3] = 2;
  absp_1[3] = 0;
  absp_2[3] = .2;
  refl_1[3] = 0;
  refl_2[3] = 0;
  // n=4    // clouds
  cond_0[4] = 0.5;
  hcap_0[4] = 2.2;
  absp_1[4] = 0;
  absp_2[4] = 0.3;
  refl_1[4] = 0.1;
  refl_2[4] = 0;
  // n=5
  cond_0[5] = 0.5;
  hcap_0[5] = 2.3;
  absp_1[5] = 0;
  absp_2[5] = 0.6;
  refl_1[5] = 0.4;
  refl_2[5] = 0;
  // n=6
  cond_0[6] = 0.5;
  hcap_0[6] = 2.5;
  absp_1[6] = 0;
  absp_2[6] = 1;
  refl_1[6] = 0.8;
  refl_2[6] = 0;
}

void draw() {
  lost_to_space = 0;
  
  float inSOLation = max(200*cos(t/600.),0);
  float AMT_r = radiate(inSOLation, -1, N-1);
  AMT_r += radiate(0,-2,N-1);
  for (int a=0; a<N; a++) {
    int x = Mat[a];
    Temp[a] += heat_inboxes[a]/hcap_0[x];
    heat_inboxes[a] = 0;
  }
  
  for (int a=0; a<N; a++)   // THERMAL RADIATION
  {
    int x = Mat[a];
    float q = hcap_0[x]*pow(Temp[a]+100, 4)/ 85500000;
    Temp[a] -= q/hcap_0[x];
    refl_up_2[a] += q/2;
    refl_dn_2[a] += q/2;
  }
  
  textFont(f, 12);
  for (int a=0; a<N; a++) 
  {
    // temperature / material colors
    fill( int(10*sqrt(Temp[a]+100)), Temp[a]+20, Mat[a]*35, 250);
    rect(200, 450- 20*a, 100, 20);
    
    fill(255);      // CREATE TEXT - TEMP*10
    text(int(Temp[a]*10), 250, 460- 20*a);
    
    // reflection amt up_1        /// DISPLAY UPWARDS REFLECTIONS
    int h = int(30*sqrt(refl_up_1[a]));
    fill( h, h, 0, 255);
    rect(304, 452- 20*a, 20, 8);
    
    // reflection amt up_2
    h = int(50*sqrt(refl_up_2[a]));
    fill( h, 0, 0, 255);
    rect(334, 452- 20*a, 20, 8);
    
  }
  
  heat_inboxes[0] += RpickUp(0, -2);
  lost_to_space = radiate(AMT_r, 2, 0) + radiate(RpickUp(0,-1),1,0);
  
  for (int a=0; a<N; a++)   /// DISPLAY DOWNWARDS REFLECTIONS
  {
    // reflection amt dn_1
    int h = int(30*sqrt(refl_dn_1[a]));
    fill( h, h, 0, 255);
    rect(304, 460- 20*a, 20, 8);
    
    // reflection amt dn_2
    h = int(50*sqrt(refl_dn_2[a]));
    fill( h, 0, 0, 255);
    rect(334, 460- 20*a, 20, 8);
  }
  
  fill(inSOLation, inSOLation, 0, 100);    // SUN
  rect(200,30,20,20);
  
  
  for (int a=0; a<N-1; a++)      // heat conduction
  {
    float dTemp = Temp[a+1]-Temp[a];
    float cond2 = (cond_0[Mat[a+1]] + cond_0[Mat[a]])/2;
    float q = dTemp * cond2 / 30;
    heat_inboxes[a+1] -= q;
    heat_inboxes[a] += q;
  }
  
  t += 1;
  
  println( inSOLation ); // incoming & outgoing 
  println(lost_to_space);
  println();
  
  fill(255);                // DRAW TEMP LINES
  rect(30,70,150,400);
  for (int a=0; a<N-1; a++)
  {
    line(100+Temp[a]/3, 460- 20*a, 100+Temp[a+1]/3, 460- 20*(a+1));
  }
  
  
  if (mousePressed)     // changing material types
  {
    int a = (450-mouseY)/20 +1;
    if ( mouseX < 250 )
      Mat[a] = (Mat[a]+6)%7;
    if ( mouseX >= 250 )
      Mat[a] = (Mat[a]+1)%7;
    delay(100);
  }
  delay(10);
}

void run_sim() {

}

float RpickUp(int a, int dir) {
  float amt = 0;
  if (dir == 1) {
    amt = refl_up_1[a];
    refl_up_1[a] = 0;
  }
  if (dir == 2) {
    amt = refl_up_2[a];
    refl_up_2[a] = 0;
  }
  if (dir == -1) {
    amt = refl_dn_1[a];
    refl_dn_1[a] = 0;
  }
  if (dir == -2) {
    amt = refl_dn_2[a];
    refl_dn_2[a] = 0;
  }
  return amt;
}

float radiate(float amt, int dir, int start) {
  float En = amt;
  if (dir > 0) {
    for (int a=start; a<N; a++) {
      // albedo happen
      int x = Mat[a];
      if (dir == 1) {
        float rloss = En * refl_1[x];  // refl
        refl_dn_1[a] += rloss;
        En -= rloss;
        rloss = En * absp_1[x];      // absp
        heat_inboxes[a] += rloss;
        En -= rloss;
      }
      if (dir == 2) {
        float rloss = En * refl_2[x];  // refl
        refl_dn_2[a] += rloss;
        En -= rloss;
        rloss = En * absp_2[x];      // absp
        heat_inboxes[a] += rloss;
        En -= rloss;
      }

      En += RpickUp(a, dir);  // pick up the cascade
    }
  }
  if (dir < 0) {
    for (int a=start; a>=0; a--) {
      // albedo happen
      int x = Mat[a];
      if (dir == -1) {
        float rloss = En * refl_1[x];  // refl
        refl_up_1[a] += rloss;
        En -= rloss;
        rloss = En * absp_1[x];      // absp
        heat_inboxes[a] += rloss;
        En -= rloss;
      }
      if (dir == -2) {
        float rloss = En * refl_2[x];  // refl
        refl_up_2[a] += rloss;
        En -= rloss;
        rloss = En * absp_2[x];      // absp
        heat_inboxes[a] += rloss;
        En -= rloss;
      }

      En += RpickUp(a, dir);  // pick up the cascade
    }
  }
  return En;
}



