
// Part of this code is based on: 

// P_2_2_4_01.pde
//
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * limited diffusion aggregation
 *
 */

void doAggregation ()
{
  //println (ag.index);
  // create a radom set of parameters
  float newR = random(1, 2.5);
  float [] [] target = findTargets (1, input);

  float newX = random(0+newR, width-newR);
  float newY = random(0+newR, height-newR);
  newX = target [0] [0];
  newY = target [0] [1];


  float oldX = 0;
  float oldY = 0;
  float oldR = 0;

  float closestDist = 100000000;
  int id = 0, motherIndex = 0;
  // which circle is the closest?
  for (int i=0; i < ag.ap.length; i++) 
  {

    Target [] pos = ag.ap[i].getPos();
    //println ("pos.length: " + pos.length);
    for (int j = 0; j < pos.length; j++)
    {
      float newDist = dist(newX, newY, pos[j].x, pos[j].y);
      if (newDist < closestDist) {
        closestDist = newDist;
        motherIndex = ag.ap[i].id;
        id = pos[j].id;
        oldX = pos[j].x;
        oldY = pos[j].y;
        oldR = pos[j].r;
      }
    }
  }

  float angle = atan2(newY-oldY, newX-oldX);
  newX = oldX + cos (angle) * (oldR+newR);
  newY = oldY + sin (angle) * (oldR+newR);

  int index = (int) newY * input.width + (int) newX;
  ag.addAggregationPoint (newX, newY, newR, motherIndex, id, input.pixels [constrain (index, 0, input.pixels.length-1) ]);
}

