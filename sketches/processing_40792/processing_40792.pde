
//http://play.lucasishuman.com/2011_09_29/
//http://play.lucasishuman.com/2011_09_29/app.pde

Thing _thing;
PVector _pos;
float _moveRadX = 100;
float _moveRadY = 50;
float _moveAng = 90;
PVector _moveCenter;
boolean _drawing = true;

void setup() {
  
  size(400, 400);
  smooth();
  
  _moveCenter = new PVector(width/2, height/4);
  _pos = new PVector(width/2, height/2);
  _thing = new Thing();
  
}

void draw() {
  
  background(50);
  
  _pos.x = _moveCenter.x + cos(radians(_moveAng)) * _moveRadX;
  _pos.y = _moveCenter.y + sin(radians(_moveAng)) * _moveRadY;

  _thing.update(_pos);

  _moveAng += 1;
  
}

void mousePressed() {

    _drawing = !_drawing;
    
    if (_drawing) {
        loop();
    } else {
        noLoop();
    }

}

class Thing {
    
    int _num = 12;
    Arm [] _arms = new Arm[_num];
    float _col;

    Thing() {
        
        _col = 240 - (_num*5);

        for (int i = 0; i < _num; i++) {
            _arms[i] = new Arm(new PVector(), _col);
            _col += 5;
        }
      
    }

    void update(Pvector pos) {
        
        pushMatrix();
        translate(pos.x, pos.y);

        for (int i = 0; i < _num; i++) {
            _arms[i].update();
        }

        popMatrix();

    }

}

class Arm {
  
    PVector _pos;
    Joint [] _joints;
    int _len;
    float _swing = random(30, 60);
    float _armAng;
    float _oscAng;
    float _angSpeed = 1;
  
    Arm(PVector pos, float col) {

        _pos = pos;
        _armAng = 90;
        _oscAng = random(90 - _swing, 90 + _swing);
        _len = floor(random(5, 7));
        _joints = new Joint[_len];

        //float col = random(200, 240);

        for (int i = 0; i < _len; i++) {
            _joints[i] = new Joint(i, _len, random(50, 100), col);
        }

    }
  
    void update() {

        for (int i = 0; i < _len; i++) {

            pushMatrix();
            translate(_pos.x, _pos.y);

            PVector startPos;
            float targetAng;

            if (i == 0) {
                startPos = new PVector(0, 0);
                targetAng = _armAng;
            } else {
                startPos = _joints[i - 1].endPos;
                targetAng = _joints[i - 1].ang;
            }

            Joint j = _joints[i];
            j.update(startPos, targetAng);

            popMatrix();

        }

        _armAng = (cos(radians(_oscAng)) * _swing) + 90;
        _oscAng += 1;

    }
 
}

class Joint {
 
    int _index;
    float _len;
    float _col;
    float _weight;
    float ang;
    PVector startPos = new PVector();
    PVector endPos = new PVector();
  
    Joint(int index, int num, float len, float col) {
        _index = index;
        _len = len;
        _col = col;
        _weight = (num*3) - index * 3;
    }
 
    void update(PVector prevPos, float targetAng) {

        startPos = prevPos;

        ang += (targetAng - ang) * 0.05;

        endPos.x = startPos.x + cos(radians(ang)) * _len;
        endPos.y = startPos.y + sin(radians(ang)) * _len;

        noStroke();
        fill(_col);
        float diam = _weight*1.35;
        ellipse(startPos.x, startPos.y, diam, diam);

        noFill();
        stroke(_col);
        strokeWeight(_weight);
        line(startPos.x, startPos.y, endPos.x, endPos.y);

    }
  
}
