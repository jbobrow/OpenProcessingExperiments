
import de.ilu.movingletters.*;

/*
  Copyright (C) 2007 Andre Seidelt, All Rights Reserved.
 
 This software is provided 'as-is', without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from the
 use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it
 freely, subject to the following restrictions:
 
 1. The origin of this software must not be misrepresented; you must not
 claim that you wrote the original software. If you use this software in
 a product, an acknowledgment in the product documentation would be
 appreciated but is not required.
 
 2. Altered source versions must be plainly marked as such, and must not be
 misrepresented as being the original software.
 
 3. This notice may not be removed or altered from any source distribution.
 */

MovingLetters letters;
color[] colors;

void setup() {
  size(685, 150);
  stroke(0, 2, 255);
  smooth();
  letters = new MovingLetters(this, 40);
  colors = new color[]{
    color(20, 20, 240), // 0
    color(40, 20, 220), // 1
    color(60, 20, 200), // 2
    color(80, 20, 180), // 3
    color(100, 20, 160), // 4
    color(120, 20, 140), // 5
    color(140, 20, 120), // 6
    color(160, 20, 100), // 7
    color(180, 20, 80), // 8
    color(200, 20, 60), // 9
    color(220, 20, 40), // 10
    color(240, 20, 20), // 11
  };
}

void draw() {
  background(0);
  int yPos = 10;

  stroke(0, 0, 255);
    yPos +=50;
 
  letters.text("#11;S#11;t#10;e#10;p#9;h#9;a#8;n#8;i#7;e#7; S#7;t#7;r#8;a#8;w#9;b#9;r#10;i#10;d#11;g#11;e", 50, yPos, 1, 1, colors);

 
}



