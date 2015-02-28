
class CA {
  Vec3D loc;
  int x;
  int y;

  float value = 0;
  boolean shaded = false;

  CA[] neigh = new CA[8];

  CA(Vec3D _loc, int _x, int _y) {
    loc = _loc;
    x = _x;
    y = _y;
    if (random(100)>50)value = int(random(55));
    //if (abs(loc.x)<240 && abs(loc.y)<240)value = 55;
    shaded = false;
  }

  void populate() {
    neigh[0] = grid[(x+cols-1)%cols][(y+rows-1)%rows];  
    neigh[1] = grid[(x+cols)%cols][(y+rows-1)%rows];
    neigh[2] = grid[(x+cols+1)%cols][(y+rows-1)%rows];
    neigh[3] = grid[(x+cols-1)%cols][(y+rows)%rows];
    neigh[4] = grid[(x+cols-1)%cols][(y+rows+1)%rows];
    neigh[5] = grid[(x+cols+1)%cols][(y+rows)%rows];
    neigh[6] = grid[(x+cols+1)%cols][(y+rows+1)%rows];
    neigh[7] = grid[(x+cols)%cols][(y+rows+1)%rows];
  }

  void run() {
    if (blowWind == true) {
      if (value >= 1 && random(100)<1*value && shaded == false) hop();
    }
    if (value > slope) avalanche();
  }

  void shade() {
    if (shaded == false && neigh[2].value < value ) {
      float shadowlength = shad*(value) - 1;
      for (int i = 1; i < shadowlength; i++) {
        CA temp = grid[(x+cols+i)%cols][abs(y+rows-i)%rows];
        if (temp.value < (value - (value * i / shadowlength))) temp.shaded = true;
      }
    }
  }

  void hop() {
    value -= 1;
    neigh[2].value += 1;
  }

  void avalanche() {
    CA temp = neigh[int(random(8))];
    float diff = value - temp.value;
    if (diff > slope) {
      value -= 1;//diff / 2 ;
      (temp.value) += 1;//diff / 2;
    }
  }


  void display() {
    //COL
    float normValue = ( 255 * (value / maxi));
    float col = 0;
    if (normalizeValue == true) {
      col = normValue;
    }
    else {
      col = (40*sqrt(value));
    }
    stroke(col);
    fill(col);

    //SPECTRUM COL
    if (spectrum == true) {
      stroke(255-(col), col, col);
      fill(255-(col), col, col);
    }

    //SHADOWS COL
    if (shadows == true) {
      if (shaded == true) {
        if (spectrum == true) {
          stroke(255-(col), col, col/2);
          fill (255-(col), col, col/2);
        }
        else {
          stroke(col / 2);
          fill (col / 2);
        }
      }
    }

    //MESH
    if (drawMesh == true) {
      strokeWeight(1);
      if (drawSurf == true) {
        stroke(0);
        strokeWeight(1.5);
      }
      if (x != cols-1 && y !=0 ) {
        CA target = neigh[2];
        line(loc.x, loc.y, exag*int(value*2), target.loc.x, target.loc.y, exag*int(target.value*2));

        /* target = neigh[6];
         if (abs(x-target.x)<3 && abs(y-target.y)<3) {
         line(loc.x, loc.y, exag*int(value*2), target.loc.x, target.loc.y, exag*int(target.value*2));
         }*/
      }
    }

    //SURF
    if (drawSurf == true) {
      strokeWeight(0);
      if (x != 0 && y !=0 ) {
        beginShape();
        vertex(loc.x, loc.y, exag*int(value*2));
        vertex(neigh[3].loc.x, neigh[3].loc.y, exag*int(neigh[3].value*2));
        vertex(neigh[0].loc.x, neigh[0].loc.y, exag*int(neigh[0].value*2));
        vertex(neigh[1].loc.x, neigh[1].loc.y, exag*int(neigh[1].value*2));
        endShape();
      }
    }

    //POINTCLOUD
    if (pointCloud == true) {
      if (value > 0) {
        strokeWeight(3.5);
        for (int i = 0; i <=exag*int(value*2); i += 10) {
          point(loc.x, loc.y, i);
        }
      }
      if (value == 0) {
        strokeWeight(1);
        stroke(40);
        if (shadows == true) {
          if (shaded == true) stroke(10);
        }
        point(loc.x, loc.y, 0);
      }
    }

    //DEFAULT
    if (pointCloud == false && drawSurf == false && drawMesh == false) {
      if (value > 0) {
        strokeWeight(2.5);
        point(loc.x, loc.y, exag*int(value*2));
      }

      if (value == 0) {
        strokeWeight(1);
        stroke(40);
        if (shadows == true) {
          if (shaded == true) stroke(10);
        }
        point(loc.x, loc.y, 0);
      }
    }
    /*------------ARRRRRRRRRRRRRRGMAX
    if (x != 0 && x != cols-1 && y !=0 && y !=rows-1) {
      int index = 0;
      float tempval = 0;
      for (int i = 0; i < 8; i++) {
        if (neigh[i].value > tempval) {
          tempval = neigh[i].value ;
          index = i;
        }
      }
      strokeWeight(1);
      stroke(255, 255, 255);
      line(neigh[index].loc.x, neigh[index].loc.y, exag*int(neigh[index].value*2), loc.x, loc.y, exag*int(value*2));
    }
    */
  }
}


