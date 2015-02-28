
PImage sasa1;
PImage sasa2;
PImage sasa3;

Ha[] ha = new Ha[100];
Rain[] rain = new Rain[500];

void setup() {
  size(400, 300);
  smooth();
  colorMode(HSB,100);
  textSize(50);
  textAlign(CENTER);
  sasa1 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/sasa1.png?attachauth=ANoY7cruNQC3EWDa4v4dM_-njOtJTIHeK3mYpf-P0O0l2oXKYTJV0ag9PQvw1Fu_qLDw_K7ulxhZv7s5kpJgrpVclmKhjVOg6qJnXmfB832svW8c0rqkB-5_fvFQ5168uPvbWMWvOnqOJv7fN-qO2BtEg6tsVBd0D-Q2s1iu3wSWLlH_fnKZ1fVMj-87TafpWAtJBP6YG_7ch02d2Fuyy1WR3vR4o_N79A%3D%3D&attredirects=0");
  sasa2 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/sasa2.png?attachauth=ANoY7colULOh6sldBnAq5kTH0Mx1VVqDXT_dVKAPA7H3TIaYQO8xcofrQPhXLhio7rjMiYIC09EzdXfG_-zftPtgFY3xmQlVhk3JvRt0zQMx66OCRrorbQDy66tzdarXa6gILsVbN691LbGv-wY7Q79-p0zm31ulqZtedjfN_VHWU-oJ7e_77qp7TfEMTbBYULdVwE2fNltdVUdLKI5GfJOG8TIb40n8lg%3D%3D&attredirects=0");
  sasa3 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/sasa3.png?attachauth=ANoY7coWc0GTGDkJ_5x87-u5x7Iq-kBi1j7xYYN-exqpqv1dTytX3qPPNXhUEyRNKEtNnzQ957vqxHwoUUtlqM1QmIt6M_oiOMidwlWNCoJEbjMPX_DTWEY3t9GpSmivJfA-2zIVaDQF42VL4yzmHQx8W-sgcL3BE_e3vcS73yf8lNCHTBdojlAUXOw8vdbxOv_xC98XURqfFmKb8v6U7YhJhqaQjaQl_A%3D%3D&attredirects=0");
  imageMode(CENTER);

  int m = minute();
  
    for(int i = 0; i < ha.length; i++) {
      ha[i] = new Ha(random(-20,width), random(-20,height),random(5),random(-20,width), random(-20,height),random(-20,width), random(-20,height));
    }
    for(int i = 0; i < rain.length; i++) {
      rain[i] = new Rain(random(width), random(height),random(5));
    }

}


void draw() { 
  int s = second();
  int m = minute();
  int h = hour();

  if(m % 2 != 0){
    background(99);
    for(int i = 0; i < ha.length; i++) {
      ha[i].move();
      ha[i].display();
    }
  }else{
    background(40);
    for(int i = 0; i < rain.length; i++) {
      rain[i].move();
      rain[i].display();
    }
  }


  if(m % 2 != 0){
    noStroke();
    fill(23,99,99,50);
    rect(0, height - s*5, width, height);

    fill(0);
    String t = h + ":" + nf(m, 2);
    text(t, width/2, height/2);
  }
  else{
    noStroke();
    fill(99,50);
    rect(0, height - s*5, width, height);
    
    fill(99);
    String t = h + ":" + nf(m, 2);
    text(t, width/2, height/2);

  }
}


class Ha {
  float x, y, s, xx, yy, xxx, yyy;
  Ha(float _x, float _y, float _s, float _xx, float _yy,float _xxx, float _yyy) {
    x = _x;
    y = _y;
    s = _s;
    xx = _xx;
    yy = _yy;
    xxx = _xxx;
    yyy = _yyy;

  }

  void move() {
    y += s;
    if (y > height) y = 0;
    yy += s;
    if (yy > height) yy = 0;
    yyy += s;
    if (yyy > height) yyy = 0;
  }

  void display() {
    tint(23,90,90);
    image(sasa1, x, y);
    image(sasa2, xx, yy);
    image(sasa3, xxx , yyy);

  }
}


class Rain {
  float x, y, s;

  Rain(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }

  void move() {
    y += s;
    if (y > height)y = 0;
  }

  void display() {
    stroke(100,random(50,100));
    line(x,y,x,y + random(70));
  }

  void time() {
    int s = second();
    int m = minute();
    int h = hour();
    noStroke();
    fill(99,50);
    rect(0, height - s*5, width, height);

    fill(99);
    String t = h + ":" + nf(m, 2);
    text(t, width/2, height/2);
  }
}











                                
