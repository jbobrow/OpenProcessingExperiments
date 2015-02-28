
void setup()
{
  size(800, 800);
}

void draw()
{
  smooth();
  
  if(mousePressed && (mouseButton == LEFT))
  {
  fill(255, 240, 220, 200);
  quad(0, 0, 10, 0, 12, 213, 0, 320);//1  
  fill(255, 240, 210, 200);
  quad(12, 213, 170, 257, 95, 90, 11, 124);//2
  fill(255, 240, 190, 200);
  triangle(11, 124, 95, 90, 10, 0);//2.5
  fill(253, 255, 204, 200);
  quad(10, 0, 52, 0, 174, 17, 95, 90);//3   
  fill(255, 250, 230, 220);
  quad(95, 90, 230, 190, 335, 71, 174, 17);//4
  fill(255, 255, 190, 220);
  triangle(95, 90, 170, 257, 230, 190);//5
  fill(255, 255, 153, 175);
  triangle(12, 213, 0, 320, 75, 230); //6
  fill(255, 240, 210, 200);
  quad(0, 320, 75, 230, 133, 245, 125, 365); //7
  fill(255, 230, 190, 130);
  quad(133, 245, 170, 257, 246, 289, 240, 410); //8
  fill(253, 255, 204, 200);
  quad(295, 145, 271, 136, 170, 257, 246, 289); //9 
  fill(255, 255, 190, 220);
  triangle(174, 17, 442, 108, 390, 0); //10
  fill(255, 230, 190, 130);
  triangle(52, 0, 390, 0, 174, 17);//11
  fill(255, 250, 230, 220);
  quad(335, 71, 345, 115, 295, 145, 271, 136); //12
  fill(255, 240, 190, 200);
  quad(442, 108, 335, 71, 345, 115,  432, 176); //13
  fill(253, 255, 204, 200);
  triangle(390, 0, 448, 126, 560, 0);//14
  fill(255, 250, 230, 220);
  quad(448, 126, 560, 0, 696, 119, 480, 172);//15
  fill(255, 240, 210, 200);
  triangle(560, 0, 646, 73,  707, 0);//16
  fill(255, 230, 190, 130);
  triangle(707, 0, 800, 100, 800, 0);//17
  fill(253, 255, 204, 200);
  quad(707, 0, 800, 100, 731, 226, 635, 85);//18
  fill(255, 240, 210, 200);
  triangle(800, 100, 800, 265, 731, 226);//19
  fill(255, 255, 153, 175);
  quad(566, 150, 665, 128, 731, 226, 666, 167);//20
  fill(255, 240, 210, 200);
  triangle(480, 172, 566, 150, 590, 340);//21
  fill(255, 255, 190, 220);
  quad(442, 108, 432, 176, 454, 278, 590, 340);//22
  fill(253, 255, 204, 200);
  quad(556, 150, 666, 167, 700, 305, 590, 340);//23
  fill(255, 230, 190, 130);
  quad(666, 167, 731, 226, 800, 265, 700, 305);//24
  fill(253, 255, 204, 200);
  quad(800, 265, 700, 305, 776, 344, 800, 333);//25
  fill(255, 255, 190, 220);
  quad(590, 340, 700, 305, 776, 344, 686, 432);//26
  fill(255, 250, 230, 220);
  triangle(700, 305, 800, 333, 800, 500);//27
  fill(253, 255, 204, 200);
  quad(700, 305, 800, 500, 717, 570, 686, 432);//28
  fill(255, 240, 190, 200);
  quad(454, 278, 590, 340, 528, 416, 470, 375);//29
  fill(255, 250, 230, 220);
  quad(590, 340, 686, 432, 542, 495, 528, 416);//30
  fill(255, 255, 190, 220);
  triangle(686, 432, 528, 714, 542, 495);//31
  fill(253, 255, 204, 200);
  quad(686, 432, 747, 692, 590, 800, 528, 714);//32
  fill(255, 240, 210, 200);
  quad(800, 500, 800, 701, 747, 692, 717, 570);//33
  fill(255, 250, 230, 220);
  quad(800, 701, 770, 800, 720, 713, 747, 692);//34
  fill(255, 250, 230, 220);
  triangle(800, 701, 770, 800, 800, 800);//35
  fill(253, 255, 204, 200);
  triangle(720, 713, 770, 800, 590, 800);//36
  fill(255, 240, 190, 200);
  triangle(590, 800, 528, 714, 480, 800);//37
  fill(253, 255, 204, 200);
  triangle(480, 800, 282, 731, 257, 800);//39
  fill(255, 255, 190, 220);
  quad(249, 716, 300, 644, 434, 686, 373, 766);//40
  fill(255, 240, 210, 200);
  triangle(282, 731, 257, 800, 178, 726);//41
  fill(255, 230, 190, 130);
  triangle(178, 726, 257, 800, 116, 800);//42
  fill(253, 255, 204, 200);
  quad(116, 800, 179, 726, 0, 730, 0, 800);//43+45+46
  fill(255, 240, 190, 200);
  quad(179, 726, 188, 639, 65, 548, 0, 610);// 44+48
  fill(255, 255, 190, 220);
  triangle(0, 610, 0, 730, 179, 726);//47
  fill(255, 255, 153, 175);
  quad(188, 639, 205, 553, 119, 478, 65, 548); //49
  fill(255, 255, 190, 220);
  quad(65, 548, 0, 610, 0, 320, 56, 341);//50
  fill(255, 240, 190, 200);
  quad(56, 341, 65, 548, 119, 478, 125, 365);//51
  fill(253, 255, 204, 200);
  triangle(119, 478, 125, 365, 205, 553);//52
  fill(255, 240, 210, 200);
  quad(205, 553, 125, 365, 133, 245, 240, 410);//53
  fill(255, 255, 190, 220);
  quad(249, 719, 300, 644, 264, 600, 246, 658);//57
  fill(253, 255, 204, 200);
  quad(411, 715, 528, 714, 480, 800, 373, 766);//58
  
  //skin
  fill(222, 39, 87);
  quad(528, 714, 423, 781, 373, 766, 411, 715);//extra arm
  fill(225, 61, 102);
  quad(282, 731, 178, 726, 246, 658, 249, 716);//54
  fill(220, 45, 90);
  triangle(178, 726, 188, 639, 246, 658);//55
  fill(222, 59, 87);
  quad(285, 522, 284, 477, 342, 438, 316, 536);//74
  fill(225, 0, 102);
  quad(316, 536, 377, 494, 370, 461, 331, 483);//77
  fill(255, 0, 52);
  quad(377, 494, 403, 478, 400, 456, 372, 475);//78
  fill(222, 39, 87);
  quad(331, 483, 370, 461, 380, 420, 342, 438);//80
  fill(255, 39, 87);
  quad(313, 458, 362, 428, 361, 413, 320, 410);//81
  fill(220, 45, 90);
  quad(320, 410, 327, 362, 342, 374, 353, 413);//82
  fill(255, 0, 52);
  quad(353, 413, 361, 413, 389, 392, 386, 372);//83
  fill(225, 0, 102);
  triangle(353, 413, 342, 374, 386, 372);//84
  fill(255, 39, 87);
  quad(361, 413, 389, 392, 380, 420, 362, 428);//85
  fill(255, 0, 52);
  quad(342, 374, 385, 372, 399, 367, 392, 338);//86
  
  //clothes
  fill(92, 225, 112);
  quad(188, 639, 246, 658, 264, 600, 205, 553); //56
  fill(51, 216, 102);
  quad(205, 553, 264, 600, 244, 554, 225, 471); //59
  fill(51, 255, 102);
  quad(264, 600, 300, 644, 315, 570, 285, 522); //60
  fill(92, 239, 112);
  quad(300, 644, 382, 670, 370, 566, 315, 570); //62
  fill(82, 239, 102);
  quad(382, 670, 370, 566, 403, 553, 427, 610); //64
  fill(51, 226, 102);
  quad(427, 610, 382, 670, 528, 714, 532, 652); //65
  fill(51, 255, 102);
  quad(427, 610, 532, 652, 539, 550, 517, 525); //66
  fill(82, 239, 102);
  triangle(517, 525, 470, 420, 466, 573); //67
  fill(92, 239, 112);
  quad(517, 525, 543, 495, 530, 418, 470, 420);//68
  fill(92, 225, 112);
  triangle(517, 525, 539, 550, 543, 495); //69
  fill(51, 255, 102);
  triangle(470, 420, 530, 418, 470, 375); //70
  fill(51, 216, 102);
  triangle(470, 375, 455, 423, 467, 495); //71
  fill(92, 239, 112);
  triangle(285, 522, 315, 570, 370, 566); //72
  fill(82, 239, 102);
  quad(370, 566, 403, 553, 403, 478, 314, 536); //73
  fill(51, 255, 102);
  triangle(434, 686, 411, 715, 528, 714); //133
  
  //hair
  fill(0, 0, 122);
  quad(244, 554, 276, 554, 268, 447, 225, 471);//61
  fill(55, 78, 225);
  triangle(244, 554, 264, 600, 276, 554);//63  
  fill(40, 106, 255);
  quad(276, 554, 268, 447, 283, 441, 285, 522);//75
  fill(23, 76, 157);
  quad(283, 441, 284, 477, 313, 458, 309, 425);//76
  fill(40, 77, 105);
  quad(225, 471, 309, 425, 243, 359, 240, 410);//87
  fill(40, 106, 255);
  quad(313, 458, 327, 362, 278, 393, 309, 425);//88
  fill(55, 78, 225);
  quad(278, 393, 327, 362, 299, 336, 266, 321);//89
  fill(55, 47, 227);
  quad(278, 393, 266, 321, 246, 289, 243, 359);//100
  fill(40, 77, 105);
  triangle(266, 321, 299, 336, 282, 293);//102
  fill(40, 106, 255);
  quad(266, 321, 282, 293, 285, 266, 256, 306);//106
  fill(0, 0, 157);
  quad(246, 289, 256, 306, 285, 266, 267, 230);//107
  fill(55, 78, 225);
  quad(285, 266, 267, 230, 320, 144, 340, 171);//108
  fill(40, 77, 105);
  triangle(267, 230, 295, 145, 320, 144);//109
  fill(40, 106, 255);
  quad(295, 145, 320, 144, 432, 176, 345, 115);//111
  fill(55, 47, 227);
  triangle(320, 145, 340, 171, 431, 176);//110
  fill(55, 78, 225);
  quad(432, 176, 409, 239, 382, 203, 384, 174);//105
  fill(0, 0, 122);
  quad(432, 176, 447, 244, 433, 269, 409, 239);//104
  fill(204, 204, 51);
  quad(409, 239, 406, 296, 417, 300, 433, 269);//103- ear
  fill(40, 77, 105);
  quad(447, 244, 460, 320, 437, 343, 417, 300);//99
  fill(55, 47, 227);
  quad(417, 300, 406, 296, 392, 338, 437, 343);//101
  fill(40, 77, 105);
  quad(392, 338, 437, 343, 440, 420, 399, 367);//95
  fill(55, 78, 225);
  quad(437, 343, 460, 320, 470, 375, 440, 420);//94
  fill(40, 106, 255);
  quad(440, 420, 399, 367, 386, 372, 389, 392);//96
  fill(55, 47, 227);
  quad(389, 392, 372, 444, 400, 456, 440, 420);//97
  fill(23, 76, 157);
  quad(372, 444, 400, 456, 372, 475, 370, 461);//98
  fill(55, 78, 225);
  quad(400, 456, 440, 420, 443, 524, 403, 478);//92
  fill(0, 0, 157);
  quad(440, 420, 470, 375, 455, 423, 468, 492);//93
  fill(55, 47, 227);
  quad(440, 420, 468, 492, 466, 573, 443, 524);//90
  fill(40, 106, 255);
  quad(403, 553, 443, 524, 466, 573, 427, 610);//79
  fill(55, 47, 227);
  triangle(403, 478, 443, 524, 403, 553);//91
  
  //face
  quad(340, 171, 384, 174, 379, 243, 339, 227);//112
  fill(255, 0, 52);
  quad(333, 300, 370, 300, 361, 314, 320, 315);//ref
  fill(222, 39, 87);
  triangle(370, 300, 362, 340, 345, 342);//ref
  fill(255, 39, 87);
  triangle(339, 227, 340, 171, 298, 244);//113
  fill(255, 0, 52);
  triangle(339, 227, 298, 244, 320, 262);//117
  fill(225, 0, 102);
  triangle(339, 227, 320, 262, 340, 255);//a
  fill(222, 39, 87);
  quad(339, 227, 340, 255, 348, 244, 379, 244);//125
  fill(153, 0, 0);
  triangle(320, 262, 298, 244, 285, 266);//114
  fill(255, 0, 52);
  quad(285, 266, 282, 293, 317, 287, 320, 262);//115
  fill(255, 39, 87);
  quad(282, 293, 299, 336, 333, 300, 317, 287);//116
  fill(255, 0, 52);
  quad(317, 287, 320, 262, 339, 227, 339, 280);//118a
  fill(222, 39, 87);
  quad(317, 287, 339, 280, 350, 300, 333, 300);//118b
  fill(255, 39, 87);
  quad(350, 300, 370, 300, 340, 255, 339, 280);//120
  fill(255, 0, 52);
  quad(382, 203, 409, 239, 406, 296, 379, 243);//124
  fill(122, 0, 0);
  quad(340, 255, 348, 244, 379, 244, 386, 257);//122a
  fill(153, 0, 0);
  triangle(386, 257, 346, 262 ,340, 255);//122b
  fill(255, 0, 52);
  quad(346, 262, 386, 257, 394, 274, 356, 279);//121
  fill(220, 45, 90);
  triangle(356, 279, 380, 315, 394, 274);//123
  fill(222, 39, 87);
  quad(380, 315, 392, 338, 406, 296, 394, 274);//ref
  fill(255, 39, 87);
  quad(299, 336, 320, 315, 329, 341, 327, 362);//ref
  fill(255, 0, 52);
  triangle(329, 341, 327, 362, 342, 374);//ref
  fill(225, 61, 102);
  quad(329, 341, 362, 340, 392, 338, 342, 374);//ref
  fill(255, 39, 87);
  quad(362, 340, 370, 300, 392, 338, 366, 356);//ref
  fill(255, 0, 52);
  quad(323, 326, 320, 315, 361, 314, 354, 328);//ref
  fill(225, 61, 102);
  quad(323, 326, 354, 328, 345, 342, 329, 341);//ref
  }
  
  if(mousePressed && (mouseButton == RIGHT))
 {
  fill(0, 15, 35, 200); //(255, 240, 220, 200);
  quad(0, 0, 10, 0, 12, 213, 0, 320);//1  
  fill(0, 15, 45, 200);
  quad(12, 213, 170, 257, 95, 90, 11, 124);//2
  fill(0, 15, 65, 200);
  triangle(11, 124, 95, 90, 10, 0);//2.5
  fill(2, 0, 51, 200);
  quad(10, 0, 52, 0, 174, 17, 95, 90);//3   
  fill(0, 5, 25, 220);
  quad(95, 90, 230, 190, 335, 71, 174, 17);//4
  fill(0, 0, 65, 220);
  triangle(95, 90, 170, 257, 230, 190);//5
  fill(0, 0, 102, 175);
  triangle(12, 213, 0, 320, 75, 230); //6
  fill(0, 15, 45, 200);
  quad(0, 320, 75, 230, 133, 245, 125, 365); //7
  fill(0, 25, 65, 130);
  quad(133, 245, 170, 257, 246, 289, 240, 410); //8
  fill(2, 0, 51, 200);
  quad(295, 145, 271, 136, 170, 257, 246, 289); //9 
  fill(0, 0, 65, 220);
  triangle(174, 17, 442, 108, 390, 0); //10
  fill(0, 25, 60, 130);
  triangle(52, 0, 390, 0, 174, 17);//11
  fill(0, 5, 25, 220);
  quad(335, 71, 345, 115, 295, 145, 271, 136); //12
  fill(0, 15, 65, 200);
  quad(442, 108, 335, 71, 345, 115,  432, 176); //13
  fill(2, 0, 51, 200);
  triangle(390, 0, 448, 126, 560, 0);//14
  fill(0, 5, 25, 220);
  quad(448, 126, 560, 0, 696, 119, 480, 172);//15
  fill(0, 15, 45, 200);
  triangle(560, 0, 646, 73,  707, 0);//16
  fill(0, 25, 60, 130);
  triangle(707, 0, 800, 100, 800, 0);//17
  fill(2, 0, 51, 200);
  quad(707, 0, 800, 100, 731, 226, 635, 85);//18
  fill(0, 15, 45, 200);
  triangle(800, 100, 800, 265, 731, 226);//19
  fill(0, 0, 102, 175);
  quad(566, 150, 665, 128, 731, 226, 666, 167);//20
  fill(0, 15, 45, 200);
  triangle(480, 172, 566, 150, 590, 340);//21
  fill(0, 0, 65, 220);
  quad(442, 108, 432, 176, 454, 278, 590, 340);//22
  fill(2, 0, 51, 200);
  quad(556, 150, 666, 167, 700, 305, 590, 340);//23
  fill(0, 25, 60, 130);
  quad(666, 167, 731, 226, 800, 265, 700, 305);//24
  fill(2, 0, 51, 200);
  quad(800, 265, 700, 305, 776, 344, 800, 333);//25
  fill(0, 0, 65, 220);
  quad(590, 340, 700, 305, 776, 344, 686, 432);//26
  fill(0, 5, 25, 220);
  triangle(700, 305, 800, 333, 800, 500);//27
  fill(2, 0, 51, 200);
  quad(700, 305, 800, 500, 717, 570, 686, 432);//28
  fill(0, 15, 65, 200);
  quad(454, 278, 590, 340, 528, 416, 470, 375);//29
  fill(0, 5, 25, 220);
  quad(590, 340, 686, 432, 542, 495, 528, 416);//30
  fill(0, 0, 65, 220);
  triangle(686, 432, 528, 714, 542, 495);//31
  fill(2, 0, 51, 200);
  quad(686, 432, 747, 692, 590, 800, 528, 714);//32
  fill(0, 15, 45, 200);
  quad(800, 500, 800, 701, 747, 692, 717, 570);//33
  fill(0, 5, 25, 220);
  quad(800, 701, 770, 800, 720, 713, 747, 692);//34
  fill(0, 5, 25, 220);
  triangle(800, 701, 770, 800, 800, 800);//35
  fill(2, 0, 51, 200);
  triangle(720, 713, 770, 800, 590, 800);//36
  fill(0, 15, 65, 200);
  triangle(590, 800, 528, 714, 480, 800);//37
  fill(2, 0, 51, 200);
  triangle(480, 800, 282, 731, 257, 800);//39
  fill(0, 0, 65, 220);
  quad(249, 716, 300, 644, 434, 686, 373, 766);//40
  fill(0, 15, 45, 200);
  triangle(282, 731, 257, 800, 178, 726);//41
  fill(0, 25, 60, 130);
  triangle(178, 726, 257, 800, 116, 800);//42
  fill(2, 0, 51, 200);
  quad(116, 800, 179, 726, 0, 730, 0, 800);//43+45+46
  fill(0, 15, 65, 200);
  quad(179, 726, 188, 639, 65, 548, 0, 610);// 44+48
  fill(0, 0, 65, 220);
  triangle(0, 610, 0, 730, 179, 726);//47
  fill(0, 0, 102, 175);
  quad(188, 639, 205, 553, 119, 478, 65, 548); //49
  fill(0, 0, 65, 220);
  quad(65, 548, 0, 610, 0, 320, 56, 341);//50
  fill(0, 15, 65, 200);
  quad(56, 341, 65, 548, 119, 478, 125, 365);//51
  fill(2, 0, 51, 200);
  triangle(119, 478, 125, 365, 205, 553);//52
  fill(0, 15, 45, 200);
  quad(205, 553, 125, 365, 133, 245, 240, 410);//53
  fill(0, 0, 65, 220);
  quad(249, 719, 300, 644, 264, 600, 246, 658);//57
  fill(2, 0, 51, 200);
  quad(411, 715, 528, 714, 480, 800, 373, 766);//58
  
  //skin
  fill(33, 216, 168);
  quad(528, 714, 423, 781, 373, 766, 411, 715);//extra arm
  fill(30, 194, 153);
  quad(282, 731, 178, 726, 246, 658, 249, 716);//54
  fill(34, 210, 165);
  triangle(178, 726, 188, 639, 246, 658);//55
  fill(33, 196, 168);
  quad(285, 522, 284, 477, 342, 438, 316, 536);//74
  fill(30, 255, 153);
  quad(316, 536, 377, 494, 370, 461, 331, 483);//77
  fill(30, 255, 203);
  quad(377, 494, 403, 478, 400, 456, 372, 475);//78
  fill(33, 216, 168);
  quad(331, 483, 370, 461, 380, 420, 342, 438);//80
  fill(0, 216, 168);
  quad(313, 458, 362, 428, 361, 413, 320, 410);//81
  fill(34, 210, 165);
  quad(320, 410, 327, 362, 342, 374, 353, 413);//82
  fill(30, 255, 203);
  quad(353, 413, 361, 413, 389, 392, 386, 372);//83
  fill(30, 255, 153);
  triangle(353, 413, 342, 374, 386, 372);//84
  fill(0, 216, 168);
  quad(361, 413, 389, 392, 380, 420, 362, 428);//85
  fill(30, 255, 203);
  quad(342, 374, 385, 372, 399, 367, 392, 338);//86
  
  //clothes
  fill(163, 0, 113);
  quad(188, 639, 246, 658, 264, 600, 205, 553); //56
  fill(204, 39, 153);
  quad(205, 553, 264, 600, 244, 554, 225, 471); //59
  fill(204, 0, 153);
  quad(264, 600, 300, 644, 315, 570, 285, 522); //60
  fill(163, 16, 113);
  quad(300, 644, 382, 670, 370, 566, 315, 570); //62
  fill(173, 16, 123);
  quad(382, 670, 370, 566, 403, 553, 427, 610); //64
  fill(204, 29, 153);
  quad(427, 610, 382, 670, 528, 714, 532, 652); //65
  fill(204, 0, 153);
  quad(427, 610, 532, 652, 539, 550, 517, 525); //66
  fill(173, 16, 123);
  triangle(517, 525, 470, 420, 466, 573); //67
  fill(163, 16, 113);
  quad(517, 525, 543, 495, 530, 418, 470, 420);//68
  fill(163, 0, 113);
  triangle(517, 525, 539, 550, 543, 495); //69
  fill(204, 0, 153);
  triangle(470, 420, 530, 418, 470, 375); //70
  fill(204, 39, 153);
  triangle(470, 375, 455, 423, 467, 495); //71
  fill(163, 16, 113);
  triangle(285, 522, 315, 570, 370, 566); //72
  fill(173, 16, 123);
  quad(370, 566, 403, 553, 403, 478, 314, 536); //73
  fill(204, 0, 153);
  triangle(434, 686, 411, 715, 528, 714); //133
  
  //hair
  fill(225, 225, 103);
  quad(244, 554, 276, 554, 268, 447, 225, 471);//61
  fill(170, 147, 30);
  triangle(244, 554, 264, 600, 276, 554);//63  
  fill(215, 149, 0);
  quad(276, 554, 268, 447, 283, 441, 285, 522);//75
  fill(232, 179, 98);
  quad(283, 441, 284, 477, 313, 458, 309, 425);//76
  fill(215, 178, 150);
  quad(225, 471, 309, 425, 243, 359, 240, 410);//87
  fill(215, 149, 0);
  quad(313, 458, 327, 362, 278, 393, 309, 425);//88
  fill(170, 147, 30);
  quad(278, 393, 327, 362, 299, 336, 266, 321);//89
  fill(200, 208, 28);
  quad(278, 393, 266, 321, 246, 289, 243, 359);//100
  fill(215, 178, 150);
  triangle(266, 321, 299, 336, 282, 293);//102
  fill(215, 149, 0);
  quad(266, 321, 282, 293, 285, 266, 256, 306);//106
  fill(255, 255, 98);
  quad(246, 289, 256, 306, 285, 266, 267, 230);//107
  fill(170, 147, 30);
  quad(285, 266, 267, 230, 320, 144, 340, 171);//108
  fill(215, 178, 150);
  triangle(267, 230, 295, 145, 320, 144);//109
  fill(215, 149, 0);
  quad(295, 145, 320, 144, 432, 176, 345, 115);//111
  fill(200, 208, 28);
  triangle(320, 145, 340, 171, 431, 176);//110
  fill(170, 147, 30);
  quad(432, 176, 409, 239, 382, 203, 384, 174);//105
  fill(225, 225, 103);
  quad(432, 176, 447, 244, 433, 269, 409, 239);//104
  fill(51, 51, 204);
  quad(409, 239, 406, 296, 417, 300, 433, 269);//103- ear
  fill(215, 178, 150);
  quad(447, 244, 460, 320, 437, 343, 417, 300);//99
  fill(200, 208, 28);
  quad(417, 300, 406, 296, 392, 338, 437, 343);//101
  fill(215, 178, 150);
  quad(392, 338, 437, 343, 440, 420, 399, 367);//95
  fill(170, 147, 30);
  quad(437, 343, 460, 320, 470, 375, 440, 420);//94
  fill(215, 149, 0);
  quad(440, 420, 399, 367, 386, 372, 389, 392);//96
  fill(200, 208, 28);
  quad(389, 392, 372, 444, 400, 456, 440, 420);//97
  fill(232, 179, 98);
  quad(372, 444, 400, 456, 372, 475, 370, 461);//98
  fill(170, 147, 30);
  quad(400, 456, 440, 420, 443, 524, 403, 478);//92
  fill(255, 255, 98);
  quad(440, 420, 470, 375, 455, 423, 468, 492);//93
  fill(200, 208, 28);
  quad(440, 420, 468, 492, 466, 573, 443, 524);//90
  fill(215, 149, 0);
  quad(403, 553, 443, 524, 466, 573, 427, 610);//79
  fill(200, 208, 28);
  triangle(403, 478, 443, 524, 403, 553);//91
  
  //face
  quad(340, 171, 384, 174, 379, 243, 339, 227);//112
  fill(30, 255, 203);
  quad(333, 300, 370, 300, 361, 314, 320, 315);//ref
  fill(33, 216, 168);
  triangle(370, 300, 362, 340, 345, 342);//ref
  fill(0, 216, 168);
  triangle(339, 227, 340, 171, 298, 244);//113
  fill(30, 255, 203);
  triangle(339, 227, 298, 244, 320, 262);//117
  fill(30, 255, 153);
  triangle(339, 227, 320, 262, 340, 255);//a
  fill(33, 216, 168);
  quad(339, 227, 340, 255, 348, 244, 379, 244);//125
  fill(102, 255, 255);
  triangle(320, 262, 298, 244, 285, 266);//114
  fill(30, 255, 203);
  quad(285, 266, 282, 293, 317, 287, 320, 262);//115
  fill(0, 216, 168);
  quad(282, 293, 299, 336, 333, 300, 317, 287);//116
  fill(30, 255, 203);
  quad(317, 287, 320, 262, 339, 227, 339, 280);//118a
  fill(33, 216, 168);
  quad(317, 287, 339, 280, 350, 300, 333, 300);//118b
  fill(0, 216, 168);
  quad(350, 300, 370, 300, 340, 255, 339, 280);//120
  fill(30, 255, 203);
  quad(382, 203, 409, 239, 406, 296, 379, 243);//124
  fill(133, 255, 255);
  quad(340, 255, 348, 244, 379, 244, 386, 257);//122a
  fill(102, 255, 255);
  triangle(386, 257, 346, 262 ,340, 255);//122b
  fill(30, 255, 203);
  quad(346, 262, 386, 257, 394, 274, 356, 279);//121
  fill(34, 210, 165);
  triangle(356, 279, 380, 315, 394, 274);//123
  fill(33, 216, 168);
  quad(380, 315, 392, 338, 406, 296, 394, 274);//ref
  fill(0, 216, 168);
  quad(299, 336, 320, 315, 329, 341, 327, 362);//ref
  fill(30, 255, 203);
  triangle(329, 341, 327, 362, 342, 374);//ref
  fill(30, 194, 153);
  quad(329, 341, 362, 340, 392, 338, 342, 374);//ref
  fill(0, 216, 168);
  quad(362, 340, 370, 300, 392, 338, 366, 356);//ref
  fill(30, 255, 203);
  quad(323, 326, 320, 315, 361, 314, 354, 328);//ref
  fill(30, 194, 153);
  quad(323, 326, 354, 328, 345, 342, 329, 341);//ref
 } 
  
  else
  {
    noStroke();
    noFill();
  }
  
}

