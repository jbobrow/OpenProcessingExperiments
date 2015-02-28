
/**
 * PolarUnravel demo combines the following 3 features of toxiclibs:
 * <ul>
 * <li>Polar-Cartesian coordinate transformation</li>
 * <li>Vector interpolation to smoothly switch layouts</li>
 * <li>Use of InterpolateStrategy for easing effects</li>
 * <li>Use TColor for working with HSV color space</li>
 * </ul>
 *
 * The demo depends on the separately distributed colorutils package, also
 * part of toxiclibs. You can download the latest version from here:
 * http://code.google.com/p/toxiclibs/downloads/list
 *
 * Usage:
 * Click mouse to toggle between radial/horizontal layout
 */

/* 
 * Copyright (c) 2009 Karsten Schmidt
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

import toxi.color.*;

import toxi.geom.*;
import toxi.math.*;

// keepers of transition state & target
float transition, transTarget;

// use a S-Curve to achieve an ease in/out effect
InterpolateStrategy is=new SigmoidInterpolation(3);

void setup() {
  size(680,382,P3D);
}

void draw() {
  background(255);
  float w2=width * 0.5;
  float h2=height * 0.5;
  translate(w2, h2);
  // update transition
  transition += (transTarget - transition) * 0.01;
  Vec2D normUp = new Vec2D(0, -1);
  // define a color container using HSV
  TColor col = TColor.newHSV(0, 1, 1);
  for(int i = 270; i < 360 + 270; i += 2) {
    float theta = radians(i);
    // create a polar coordinate
    Vec2D polar = new Vec2D(100,theta);
    // use theta as color hue (ensure theta is properly wrapped)
    col.setHue((polar.y / TWO_PI) % 1);
    // also use theta to manipulate line length
    float len = noise(polar.y * 4) * 100;
    // convert polar coord into cartesian space (to obtain position on a circle)
    Vec2D circ = polar.copy().toCartesian();
    // create another coord splicing the circle at the top and using theta difference as position on a line
    Vec2D linear = new Vec2D((MathUtils.THREE_HALVES_PI - polar.y) * w2 / PI + w2, 0);
    // interprete circular position as normal/direction vector 
    Vec2D dir = circ.getNormalized();
    // interpolate both position & normal based on current transition state
    circ.interpolateToSelf(linear, transition,is);
    dir.interpolateToSelf(normUp, transition,is).normalizeTo(len);
    // apply color & draw line
    stroke(col.toARGB());
    line(circ.x, circ.y, circ.x + dir.x, circ.y + dir.y);
  }
}

void mousePressed() {
  // toggle transition target state
  transTarget=(++transTarget % 2);
}


