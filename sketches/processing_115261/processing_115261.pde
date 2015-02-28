
float t = 0;
float dt = 0.01;
//Below is how you change the slope field, changing the drawing.
//try some of the commented out functions, or write your own
//this can create totally different drawings
float slope(float x, float y) {
  float slope = -cos(x/50)/sin(y/50)+mag(540-x,720-y)/350;
  return slope;
}
float l = 1;
float asign = 1;
float askip = 0;
float bsign = 1;
float bskip = 0;
float csign = 1;
float cskip = 0;
float dsign = 1;
float dskip = 0;
float esign = 1;
float eskip = 0;
float fsign = 1;
float fskip = 0;
float ax = random(1080);
float ay = random(360)+360;
float bx = random(1080);
float by = random(360)+360;
float cx = random(1080);
float cy = random(360)+360;
float dx = random(1080);
float dy = random(360)+360;
float ex = random(1080);
float ey = random(360)+360;
float fx = random(1080);
float fy = random(360)+360;
void setup() {
  size (1080, 720);
  background (142,85,39);
}

void draw() {
//line 1 starts here
  stroke(0);
  if (slope(ax,ay)>10){
    askip = 0;
    while (abs(slope(ax, ay+askip)) > 10){
      askip+= asign;
    }
    line(ax, ay, ax, ay + askip);
    ay += askip;
    if (slope(ax,ay) < 0){
      asign = (-1) * asign;
    }
  } else if (slope(ax,ay)<-10){
    askip = 0;
    while (abs(slope(ax, ay+askip)) > 10){
      askip -= asign;
    }
    line(ax, ay, ax, ay + askip);
    ay += askip;
    if (slope(ax,ay) > 0){
      asign = (-1) * asign;
    }
  } else{
    float sfa = l / mag(slope(ax,ay),1);
    float adx = asign*sfa;
    float ady = asign*slope(ax,ay)*sfa;
    line(ax, ay, ax+adx, ay+ady);
    ax += adx;
    ay += ady;
  }

//line 2 starts here    
  stroke(40);
  if (slope(bx,by)>10){
    bskip = 0;
    while (abs(slope(bx, by+bskip)) > 10){
      bskip += bsign;
    }
    line(bx, by, bx, by + bskip);
    by += bskip;
    if (slope(bx,by) < 0){
      bsign = (-1) * bsign;
    }
  } else if (slope(bx,by)<-10){
    bskip = 0;
    while (abs(slope(bx, by+bskip)) > 10){
      bskip -= bsign;
    }
    line(bx, by, bx, by + bskip);
    by += bskip;
    if (slope(bx,by) > 0){
      bsign = (-1) * bsign;
    }
  } else{
    float sfb = l / mag(slope(bx,by),1);
    float bdx = bsign*sfb;
    float bdy = bsign*slope(bx,by)*sfb;
    line(bx, by, bx+bdx, by+bdy);
    bx += bdx;
    by += bdy;
  }
//line 3 starts here
  stroke(80);
  if (slope(cx,cy)>10){
    cskip = 0;
    while (abs(slope(cx, cy+cskip)) > 10){
      cskip+= csign;
    }
    line(cx, cy, cx, cy + cskip);
    cy += cskip;
    if (slope(cx,cy) < 0){
      csign = (-1) * csign;
    }
  } else if (slope(cx,cy)<-10){
    cskip = 0;
    while (abs(slope(cx, cy+cskip)) > 10){
      cskip -= csign;
    }
    line(cx, cy, cx, cy + cskip);
    cy += cskip;
    if (slope(cx,cy) > 0){
      csign = (-1) * csign;
    }
  } else{
    float sfc = l / mag(slope(cx,cy),1);
    float cdx = csign*sfc;
    float cdy = csign*slope(cx,cy)*sfc;
    line(cx, cy, cx+cdx, cy+cdy);
    cx += cdx;
    cy += cdy;
  }
//line 4 starts here
  stroke(120);
  if (slope(dx,dy)>10){
    dskip = 0;
    while (abs(slope(dx, dy+dskip)) > 10){
      dskip+= dsign;
    }
    line(dx, dy, dx, dy + dskip);
    dy += dskip;
    if (slope(dx,dy) < 0){
      dsign = (-1) * dsign;
    }
  } else if (slope(dx,dy)<-10){
    dskip = 0;
    while (abs(slope(dx, dy+dskip)) > 10){
      dskip -= dsign;
    }
    line(dx, dy, dx, dy + dskip);
    dy += dskip;
    if (slope(dx,dy) > 0){
      dsign = (-1) * dsign;
    }
  } else{
    float sfd = l / mag(slope(dx,dy),1);
    float ddx = dsign*sfd;
    float ddy = dsign*slope(dx,dy)*sfd;
    line(dx, dy, dx+ddx, dy+ddy);
    dx += ddx;
    dy += ddy;
  }
//line 5 starts here
  stroke(160);
  if (slope(ex,ey)>10){
    eskip = 0;
    while (abs(slope(ex, ey+eskip)) > 10){
      eskip+= esign;
    }
    line(ex, ey, ex, ey + eskip);
    ey += eskip;
    if (slope(ex,ey) < 0){
      esign = (-1) * esign;
    }
  } else if (slope(ex,ey)<-10){
    eskip = 0;
    while (abs(slope(ex, ey+eskip)) > 10){
      eskip -= esign;
    }
    line(ex, ey, ex, ey + eskip);
    ey += eskip;
    if (slope(ex,ey) > 0){
      esign = (-1) * esign;
    }
  } else{
    float sfe = l / mag(slope(ex,ey),1);
    float edx = esign*sfe;
    float edy = esign*slope(ex,ey)*sfe;
    line(ex, ey, ex+edx, ey+edy);
    ex += edx;
    ey += edy;
  }
//line 6 starts here
  stroke(200);
  if (slope(fx,fy)>10){
    fskip = 0;
    while (abs(slope(fx, fy+fskip)) > 10){
      fskip+= fsign;
    }
    line(fx, fy, fx, fy + fskip);
    fy += fskip;
    if (slope(fx,fy) < 0){
      fsign = (-1) * fsign;
    }
  } else if (slope(fx,fy)<-10){
    fskip = 0;
    while (abs(slope(fx, fy+fskip)) > 10){
      fskip -= fsign;
    }
    line(fx, fy, fx, fy + fskip);
    fy += fskip;
    if (slope(fx,fy) > 0){
      fsign = (-1) * fsign;
    }
  } else{
    float sff = l / mag(slope(fx,fy),1);
    float fdx = fsign*sff;
    float fdy = fsign*slope(fx,fy)*sff;
    line(fx, fy, fx+fdx, fy+fdy);
    fx += fdx;
    fy += fdy;
  }
}


