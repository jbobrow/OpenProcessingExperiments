

//void setup(){
  size(800,800);
  smooth();
  background(255);
//  fill(#FFE8D8);
//  noStroke();
//  ellipse (250,400,800,1200);


// Based on some code that I exported with Ai2Processing
// See: http://bezier.de/processing/ai2p/






//GLASSES - little connector
  pushMatrix();
        translate( 288, height-563 );
//        translate( x, y );
        strokeWeight(12);
        stroke(0 , 0 , 0 , 255);
        fill(0 , 0 , 0 , 255);
        beginShape();
        vertex( 4 , 0 );
        bezierVertex( 1 , 3 , 0 , 10 , 0 , 17);
        bezierVertex( 0 , 23 , 3 , 39 , 3 , 39);
    endShape();
    popMatrix();




// GLASSES - arm piece
    pushMatrix();
        translate( 616, height-578 );
        strokeWeight(12);
        stroke(0 , 0 , 0 , 255);
        noFill();
        beginShape();
    vertex( 0 , 0 );
        bezierVertex( 0 , 0 , 42 , 8 , 50 , 8);
        bezierVertex( 59 , 8 , 55 , 48 , 50 , 49);
        bezierVertex( 46 , 50 , 9 , 52 , 5 , 68);
    endShape();
    popMatrix();





//   GLASSES - right frame
    pushMatrix();
        translate( 195, height-614 );
        strokeWeight(12);
        stroke(0 , 0 , 0 , 255);
        noFill();
        beginShape();
    vertex( 0 , 51 );
        bezierVertex( 0 , 51 , 74 , 53 , 93 , 53);
        bezierVertex( 112 , 53 , 75 , 1 , 271 , 1);
        bezierVertex( 467 , 1 , 426 , 69 , 426 , 86);
        bezierVertex( 426 , 103 , 438 , 233 , 271 , 233);
        bezierVertex( 104 , 233 , 101 , 92 , 95 , 86);
        bezierVertex( 89 , 80 , 22 , 70 , 3 , 89);
    endShape();
    popMatrix();





//    GLASSES - left frame
    pushMatrix();
        translate( 0, height-614 );
        strokeWeight(12);
        stroke(0 , 0 , 0 , 255);
        noFill();
        beginShape();
    vertex( 0 , 6 );
        bezierVertex( 3 , 6 , 52 , 1 , 69 , 1);
        bezierVertex( 101 , 1 , 198 , 14 , 198 , 68);
        bezierVertex( 198 , 123 , 186 , 242 , 30 , 242);
        bezierVertex( 0 , 242 , 0 , 242 , 0 , 242);
    endShape();
    popMatrix();





//    LOWER BEARD
    pushMatrix();
        translate( 3, height-319 );
        strokeWeight(8);
        stroke(140.000006854534 , 98.000001758337 , 57.0000004023314 , 255);
        noFill();
        beginShape();
    vertex( 27 , 207 );
        bezierVertex( 27 , 207 , 0 , 235 , 3 , 254);
        bezierVertex( 6 , 272 , 9 , 224 , 27 , 224);
        bezierVertex( 45 , 224 , -11 , 285 , 2 , 302);
        bezierVertex( 16 , 319 , 34 , 228 , 57 , 228);
        bezierVertex( 79 , 228 , 27 , 290 , 28 , 311);
        bezierVertex( 30 , 332 , 82 , 224 , 85 , 239);
        bezierVertex( 88 , 254 , 36 , 319 , 69 , 319);
        bezierVertex( 102 , 319 , 90 , 216 , 107 , 236);
        bezierVertex( 123 , 255 , 91 , 317 , 107 , 310);
        bezierVertex( 122 , 303 , 135 , 233 , 135 , 249);
        bezierVertex( 134 , 266 , 121 , 323 , 135 , 315);
        bezierVertex( 148 , 308 , 145 , 225 , 162 , 257);
        bezierVertex( 179 , 288 , 149 , 313 , 159 , 313);
        bezierVertex( 169 , 313 , 170 , 253 , 174 , 257);
        bezierVertex( 178 , 262 , 165 , 314 , 178 , 314);
        bezierVertex( 190 , 314 , 190 , 253 , 195 , 263);
        bezierVertex( 200 , 272 , 180 , 320 , 195 , 315);
        bezierVertex( 210 , 309 , 209 , 249 , 214 , 263);
        bezierVertex( 219 , 277 , 209 , 310 , 219 , 310);
        bezierVertex( 229 , 309 , 223 , 266 , 229 , 269);
        bezierVertex( 235 , 273 , 233 , 313 , 238 , 311);
        bezierVertex( 243 , 309 , 239 , 256 , 249 , 260);
        bezierVertex( 258 , 263 , 247 , 309 , 259 , 307);
        bezierVertex( 271 , 306 , 254 , 249 , 263 , 254);
        bezierVertex( 272 , 258 , 266 , 310 , 275 , 309);
        bezierVertex( 283 , 309 , 278 , 251 , 287 , 257);
        bezierVertex( 297 , 262 , 282 , 306 , 292 , 308);
        bezierVertex( 302 , 309 , 300 , 259 , 321 , 263);
        bezierVertex( 341 , 267 , 303 , 299 , 316 , 305);
        bezierVertex( 329 , 311 , 327 , 233 , 337 , 243);
        bezierVertex( 346 , 254 , 323 , 309 , 337 , 309);
        bezierVertex( 350 , 309 , 340 , 234 , 355 , 243);
        bezierVertex( 371 , 253 , 341 , 297 , 355 , 301);
        bezierVertex( 369 , 304 , 357 , 239 , 375 , 239);
        bezierVertex( 393 , 239 , 355 , 311 , 381 , 310);
        bezierVertex( 406 , 309 , 377 , 221 , 391 , 222);
        bezierVertex( 405 , 223 , 396 , 314 , 410 , 311);
        bezierVertex( 424 , 307 , 397 , 215 , 410 , 214);
        bezierVertex( 422 , 213 , 415 , 310 , 436 , 306);
        bezierVertex( 458 , 302 , 416 , 210 , 428 , 210);
        bezierVertex( 440 , 209 , 431 , 190 , 443 , 204);
        bezierVertex( 455 , 218 , 442 , 302 , 460 , 302);
        bezierVertex( 478 , 302 , 443 , 185 , 460 , 196);
        bezierVertex( 476 , 206 , 469 , 314 , 484 , 308);
        bezierVertex( 500 , 302 , 474 , 203 , 493 , 207);
        bezierVertex( 511 , 210 , 491 , 305 , 510 , 305);
        bezierVertex( 529 , 305 , 496 , 202 , 518 , 207);
        bezierVertex( 541 , 211 , 515 , 313 , 535 , 312);
        bezierVertex( 555 , 311 , 517 , 172 , 539 , 172);
        bezierVertex( 562 , 172 , 539 , 320 , 553 , 315);
        bezierVertex( 567 , 310 , 545 , 154 , 560 , 156);
        bezierVertex( 575 , 158 , 557 , 311 , 576 , 308);
        bezierVertex( 595 , 305 , 561 , 152 , 571 , 140);
        bezierVertex( 580 , 128 , 588 , 294 , 600 , 273);
        bezierVertex( 612 , 252 , 571 , 131 , 579 , 118);
        bezierVertex( 586 , 105 , 612 , 261 , 619 , 240);
        bezierVertex( 626 , 219 , 578 , 118 , 593 , 113);
        bezierVertex( 609 , 109 , 642 , 210 , 639 , 181);
        bezierVertex( 635 , 152 , 609 , 105 , 609 , 97);
        bezierVertex( 609 , 89 , 651 , 171 , 651 , 145);
        bezierVertex( 651 , 119 , 612 , 87 , 614 , 77);
        bezierVertex( 616 , 67 , 650 , 122 , 651 , 105);
        bezierVertex( 653 , 87 , 619 , 67 , 625 , 59);
        bezierVertex( 630 , 51 , 658 , 89 , 658 , 77);
        bezierVertex( 658 , 65 , 629 , 50 , 633 , 43);
        bezierVertex( 636 , 37 , 656 , 60 , 661 , 48);
        bezierVertex( 667 , 37 , 630 , 36 , 645 , 27);
        bezierVertex( 660 , 19 , 669 , 36 , 669 , 23);
        bezierVertex( 669 , 11 , 641 , 25 , 658 , 13);
        bezierVertex( 675 , 1 , 675 , 1 , 675 , 1);
    endShape();
    popMatrix();




//    UPPER BEARD
    pushMatrix();
          translate( 50, height-238 );
        strokeWeight(8);
        stroke(140.000006854534 , 98.000001758337 , 57.0000004023314 , 255);
        noFill();
        beginShape();
    vertex( 99 , 12 );
        bezierVertex( 99 , 12 , 12 , 84 , 1 , 126);
        bezierVertex( -10 , 167 , 94 , 20 , 112 , 14);
        bezierVertex( 129 , 9 , 56 , 84 , 45 , 113);
        bezierVertex( 34 , 142 , 116 , 17 , 130 , 12);
        bezierVertex( 144 , 6 , 94 , 70 , 93 , 87);
        bezierVertex( 92 , 104 , 152 , -1 , 160 , 5);
        bezierVertex( 168 , 10 , 116 , 74 , 124 , 79);
        bezierVertex( 132 , 84 , 170 , 4 , 176 , 4);
        bezierVertex( 181 , 5 , 141 , 72 , 155 , 73);
        bezierVertex( 170 , 73 , 185 , 5 , 192 , 7);
        bezierVertex( 198 , 9 , 177 , 58 , 183 , 61);
        bezierVertex( 189 , 63 , 200 , 9 , 206 , 12);
        bezierVertex( 212 , 16 , 188 , 64 , 202 , 69);
        bezierVertex( 215 , 73 , 210 , 7 , 216 , 11);
        bezierVertex( 222 , 15 , 236 , 58 , 230 , 65);
        bezierVertex( 223 , 72 , 245 , 8 , 235 , 8);
        bezierVertex( 225 , 8 , 242 , 66 , 251 , 66);
        bezierVertex( 260 , 66 , 246 , 7 , 256 , 7);
        bezierVertex( 267 , 7 , 251 , 66 , 271 , 66);
        bezierVertex( 291 , 66 , 264 , 9 , 271 , 4);
        bezierVertex( 278 , 0 , 284 , 54 , 301 , 69);
        bezierVertex( 318 , 83 , 280 , 0 , 291 , 1);
        bezierVertex( 302 , 1 , 312 , 66 , 323 , 74);
        bezierVertex( 334 , 82 , 297 , -10 , 311 , 0);
        bezierVertex( 325 , 11 , 335 , 68 , 346 , 79);
        bezierVertex( 356 , 89 , 313 , 0 , 332 , 5);
        bezierVertex( 350 , 11 , 349 , 74 , 363 , 79);
        bezierVertex( 377 , 84 , 336 , -2 , 350 , 6);
        bezierVertex( 363 , 14 , 363 , 75 , 394 , 87);
        bezierVertex( 424 , 98 , 351 , 0 , 367 , 5);
        bezierVertex( 383 , 10 , 403 , 97 , 416 , 103);
        bezierVertex( 429 , 109 , 376 , 3 , 387 , 3);
        bezierVertex( 397 , 3 , 419 , 115 , 436 , 118);
        bezierVertex( 453 , 121 , 394 , 24 , 402 , 5);
        bezierVertex( 411 , -13 , 443 , 120 , 467 , 115);
        bezierVertex( 490 , 109 , 417 , 0 , 417 , 0);
    endShape();
    popMatrix();







//    // path item 7 ""
    pushMatrix();
        translate( 104, height-152 );
        strokeWeight(12);
        stroke(165.000005364418 , 0 , 12.0000002346933 , 255);
        noFill();
        beginShape();
    vertex( 123 , 79 );
        bezierVertex( 99 , 79 , 28 , 56 , 0 , 47);
        bezierVertex( 11 , 42 , 28 , 33 , 54 , 23);
        bezierVertex( 90 , 8 , 115 , 0 , 121 , 0);
        bezierVertex( 129 , 0 , 134 , 2 , 140 , 4);
        bezierVertex( 146 , 6 , 152 , 9 , 160 , 9);
        bezierVertex( 168 , 9 , 175 , 6 , 183 , 4);
        bezierVertex( 190 , 2 , 198 , 0 , 206 , 0);
        bezierVertex( 215 , 0 , 248 , 6 , 277 , 12);
        bezierVertex( 294 , 15 , 308 , 17 , 319 , 19);
        bezierVertex( 308 , 25 , 292 , 34 , 275 , 42);
        bezierVertex( 241 , 59 , 215 , 69 , 205 , 69);
        bezierVertex( 188 , 69 , 182 , 67 , 177 , 65);
        bezierVertex( 174 , 64 , 170 , 63 , 163 , 63);
        bezierVertex( 155 , 63 , 150 , 67 , 147 , 70);
        bezierVertex( 142 , 75 , 138 , 79 , 123 , 79);
    popMatrix();





//    HEAD
    pushMatrix();
          translate( 616, height-801 );
        strokeWeight(8);
        stroke(251.000000238419 , 176.000004708767 , 59.0000002831221 , 255);
        noFill();
        beginShape();
    vertex( 28 , 205 );
        bezierVertex( 28 , 205 , 28 , 137 , 28 , 97);
        bezierVertex( 28 , 57 , 17 , 23 , 0 , 1);
    endShape();
    popMatrix();





//    EAR
    pushMatrix();
        translate( 671, height-559 );
        strokeWeight(8);
        stroke(251.000000238419 , 176.000004708767 , 59.0000002831221 , 255);
        noFill();
        beginShape();
    vertex( 12 , 196 );
        bezierVertex( 23 , 201 , 11 , 167 , 19 , 145);
        bezierVertex( 28 , 124 , 46 , 82 , 41 , 49);
        bezierVertex( 37 , 17 , 32 , -8 , 16 , 3);
        bezierVertex( 0 , 13 , 0 , 11 , 0 , 11);
    endShape();
    popMatrix();



//    NOSE - right side
    pushMatrix();
        translate( 355, height-356 );
        strokeWeight(8);
        stroke(251.000000238419 , 176.000004708767 , 59.0000002831221 , 255);
        noFill();
        beginShape();
    vertex( 0 , 0 );
        bezierVertex( 0 , 15 , 29 , 45 , 29 , 60);
        bezierVertex( 29 , 76 , 18 , 106 , 0 , 106);
    endShape();
    popMatrix();




//    NOSE - left side
    pushMatrix();
        translate( 138, height-349 );
        strokeWeight(8);
        stroke(251.000000238419 , 176.000004708767 , 59.0000002831221 , 255);
        noFill();
        beginShape();
    vertex( 16 , 0 );
        bezierVertex( 16 , 20 , 0 , 44 , 0 , 57);
        bezierVertex( 0 , 71 , 19 , 107 , 39 , 107);
    endShape();
    popMatrix();





//    NOSE - middle
    pushMatrix();
        translate( 177, height-292 );
        strokeWeight(8);
        stroke(251.000000238419 , 176.000004708767 , 59.0000002831221 , 255);
        noFill();
        beginShape();
    vertex( 29 , 23 );
        bezierVertex( 29 , 23 , 22 , 27 , 14 , 27);
        bezierVertex( 5 , 27 , 0 , 21 , 0 , 14);
        bezierVertex( 0 , 8 , 6 , 8 , 8 , 8);
        bezierVertex( 11 , 8 , 46 , 42 , 72 , 42);
        bezierVertex( 98 , 42 , 123 , 0 , 149 , 0);
        bezierVertex( 155 , 0 , 157 , 5 , 157 , 10);
        bezierVertex( 157 , 14 , 148 , 15 , 143 , 15);
        bezierVertex( 138 , 15 , 131 , 8 , 131 , 8);
    endShape();
    popMatrix();





