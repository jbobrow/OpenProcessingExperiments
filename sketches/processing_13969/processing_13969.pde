
// "Circnosis"
// Jason Overmyer
void setup() {
  size(750, 550);
  smooth();
  noFill();  
}

int frame = -1;
int pause = 1025;

// The 1,065 circles that compose "Circnosis" are drawn as an 
// animation.  Each case in the switch statement adds additional
// circles to the animation.
void draw() {   
  switch(frame) {
    case -1:
      background(255, 255, 255);
      break;
    case 0:
      ellipse(520, 106, 5, 5);
      break;
    case 1:
      ellipse(113, 183, 5, 5);
      break;
    case 2:
      ellipse(279, 222, 5, 5);    
      break;
    case 3:
      ellipse(637, 228, 5, 5);
      break;
    case 4:
      ellipse(637, 243, 5, 5);      
      break;
    case 5:
      ellipse(570, 152, 5, 5); 
      ellipse(406, 139, 5, 5);      
      break;
    case 6:
      ellipse(365, 231, 5, 5);
      ellipse(325, 166, 5, 5);      
      break;
    case 7:
      ellipse(637, 273, 5, 5);   
      ellipse(408, 93, 5, 5);      
      ellipse(520, 373, 5, 5);       
      break;
    case 8:
      ellipse(230, 151, 5, 5);
      ellipse(113, 258, 5, 5);  
      ellipse(279, 222, 5, 5);      
      break;
    case 9:
      ellipse(520, 126, 5, 5); 
      ellipse(409, 401, 5, 5);
      ellipse(382, 134, 5, 5);
      break;
    case 10:
      ellipse(113, 268, 5, 5);  
      ellipse(462, 371, 5, 5); 
      ellipse(389, 190, 5, 5);        
      break;
    case 11:
      ellipse(113, 188, 5, 5);
      ellipse(375, 232, 5, 5);
      ellipse(375, 168, 5, 5);      
      break;
    case 12:
      ellipse(279, 192, 5, 5);
      ellipse(390, 230, 5, 5);
      ellipse(180, 167, 5, 5);      
      break;
    case 13:
      ellipse(387, 200, 5, 5);
      ellipse(414, 216, 5, 5);   
      ellipse(230, 101, 5, 5);      
      break;
    case 14:
      ellipse(383, 204, 5, 5);
      ellipse(520, 136, 5, 5);
      ellipse(279, 212, 5, 5);      
      break;
    case 15:     
      ellipse(424, 364, 5, 5);    
      ellipse(427, 183, 5, 5);       
      ellipse(402, 189, 5, 5);
      break;
    case 16:
      ellipse(326, 364, 5, 5);
      ellipse(418, 199, 5, 5);      
      ellipse(378, 148, 5, 5);      
      break;
    case 17:
      ellipse(379, 413, 5, 5);
      ellipse(368, 134, 5, 5);      
      ellipse(180, 192, 5, 5);
      break;
    case 18:
      ellipse(520, 373, 5, 5); 
      ellipse(416, 191, 5, 5);    
      ellipse(230, 181, 5, 5);      
      break;
    case 19:
      ellipse(365, 231, 5, 5); 
      ellipse(520, 151, 5, 5);    
      ellipse(363, 200, 5, 5);      
      break;   
    case 20:
      ellipse(375, 295, 120, 120);     
      break;
    case 21:
      ellipse(319, 234, 45, 45);
      break;
    case 22:
      ellipse(431, 234, 45, 45);
      break;
    case 23:
      ellipse(411, 156, 3, 3); 
      break;
    case 24:
      ellipse(279, 250, 3, 3);
      break;
    case 25:
      ellipse(219, 179, 3, 3);  
      break;
    case 26:
      ellipse(300, 410, 3, 3);
      break;
    case 27:
      ellipse(471, 250, 3, 3);    
      ellipse(190, 226, 3, 3);
      break;
    case 28:
      ellipse(566, 188, 3, 3); 
      ellipse(310, 446, 3, 3);  
      ellipse(472, 472, 3, 3);
      break;
    case 29:
      ellipse(502, 452, 3, 3);  
      ellipse(338, 170, 3, 3);
      ellipse(395, 202, 3, 3); 
      ellipse(389, 193, 3, 3);      
      break;
    case 30:
      ellipse(363, 200, 1, 1);
      ellipse(367, 204, 1, 1);
      ellipse(363, 220, 1, 1);
      ellipse(387, 200, 1, 1);
      break;
    case 31:
      ellipse(383, 204, 1, 1);
      ellipse(387, 220, 1, 1);
      ellipse(360, 235, 1, 1);
      ellipse(390, 235, 1, 1);   
      break;
    case 32:
      ellipse(319, 234, 1, 1);      
      ellipse(346, 89, 1, 1);
      ellipse(404, 89, 1, 1);   
      ellipse(431, 234, 1, 1);     
      break;
    case 33:
      ellipse(326, 364, 1, 1); 
      ellipse(424, 364, 1, 1);
      ellipse(379, 413, 1, 1); 
      ellipse(409, 401, 1, 1);   
      break;
    case 34:
      ellipse(462, 371, 1, 1);      
      ellipse(482, 359, 1, 1);
      ellipse(520, 373, 1, 1);  
      ellipse(534, 382, 1, 1);
      ellipse(548, 394, 1, 1); 
      break;
    case 35:
      ellipse(554, 401, 1, 1);  
      ellipse(525, 398, 1, 1);   
      ellipse(524, 406, 1, 1);
      ellipse(546, 369, 1, 1); 
      ellipse(554, 366, 1, 1);
      break;
    case 36:
      ellipse(180, 132, 5, 5);
      ellipse(230, 136, 5, 5);      
      ellipse(482, 359, 5, 5);   
      ellipse(350, 226, 5, 5);      
      break;    
    case 37:
      ellipse(520, 101, 5, 5); 
      ellipse(534, 382, 5, 5); 
      ellipse(345, 212, 5, 5);    
      ellipse(340, 220, 5, 5);      
      break; 
    case 38:
      ellipse(279, 187, 5, 5);
      ellipse(345, 223, 5, 5);    
      ellipse(414, 197, 5, 5);    
      ellipse(332, 151, 5, 5);       
      break;
    case 39:
      ellipse(113, 168, 5, 5);   
      ellipse(425, 195, 5, 5); 
      ellipse(412, 185, 5, 5);      
      ellipse(364, 129, 5, 5);        
      break;
    case 40:
      ellipse(637, 178, 5, 5);   
      ellipse(423, 161, 5, 5);      
      ellipse(380, 188, 5, 5);  
      ellipse(410, 214, 5, 5);      
      break;
    case 41:
      ellipse(637, 288, 5, 5);  
      ellipse(386, 129, 5, 5);     
      ellipse(343, 185, 5, 5);
      ellipse(422, 184, 5, 5);      
      break;
    case 42:
      ellipse(367, 204, 5, 5);    
      ellipse(335, 204, 5, 5);     
      ellipse(378, 173, 5, 5);     
      ellipse(407, 145, 5, 5);      
      break;
    case 43:
      ellipse(387, 220, 5, 5);    
      ellipse(334, 159, 5, 5);      
      ellipse(397, 185, 5, 5);  
      ellipse(375, 138, 5, 5);          
      break;
    case 44:
      ellipse(375, 143, 5, 5);
      ellipse(338, 180, 5, 5);
      ellipse(471, 212, 5, 5);    
      ellipse(416, 173, 5, 5);      
      break;
    case 45:
      ellipse(180, 235, 5, 5);    
      ellipse(373, 158, 5, 5);      
      ellipse(113, 253, 5, 5);
      ellipse(415, 167, 5, 5);      
      break;
    case 46:
      ellipse(342, 93, 5, 5);    
      ellipse(388, 148, 5, 5);  
      ellipse(637, 253, 5, 5);         
      ellipse(347, 205, 5, 5);      
      break;
    case 47:
      ellipse(385, 231, 5, 5);    
      ellipse(570, 172, 5, 5); 
      ellipse(637, 293, 5, 5);      
      break;
    case 48:
      ellipse(400, 226, 5, 5);     
      ellipse(570, 112, 5, 5);  
      ellipse(520, 249, 5, 5);      
      ellipse(404, 195, 5, 5);       
      break;
    case 49:
      ellipse(323, 189, 5, 5);  
      ellipse(520, 181, 5, 5);     
      ellipse(471, 187, 5, 5);  
      ellipse(355, 190, 5, 5);     
      break;
    case 50:
      ellipse(427, 171, 5, 5);   
      ellipse(400, 220, 5, 5);
      ellipse(405, 212, 5, 5);      
      ellipse(410, 220, 5, 5);           
      break;
    case 51:
      ellipse(363, 220, 5, 5);   
      ellipse(360, 230, 5, 5); 
      ellipse(325, 195, 5, 5);      
      ellipse(380, 178, 5, 5);      
      break;
    case 52:
      ellipse(380, 232, 5, 5);  
      ellipse(350, 226, 5, 5);
      ellipse(415, 146, 5, 5);  
      ellipse(383, 148, 5, 5);      
      break;
    case 53:
      ellipse(336, 216, 5, 5);  
      ellipse(421, 156, 5, 5);     
      ellipse(337, 209, 5, 5);      
      ellipse(570, 240, 5, 5);      
      break;
    case 54:
      ellipse(425, 166, 5, 5);    
      ellipse(396, 133, 5, 5); 
      ellipse(328, 174, 5, 5);     
      ellipse(230, 126, 5, 5);      
      break;
    case 55:
      ellipse(401, 136, 5, 5);    
      ellipse(345, 218, 5, 5);
      ellipse(392, 137, 5, 5);
      ellipse(570, 137, 5, 5);      
      break;
    case 56:
      ellipse(372, 133, 5, 5);    
      ellipse(330, 169, 5, 5);      
      ellipse(365, 140, 5, 5);      
      ellipse(230, 166, 5, 5);      
      break;
    case 57:
      ellipse(400, 215, 5, 5);   
      ellipse(358, 137, 5, 5);      
      ellipse(355, 144, 5, 5);  
      ellipse(520, 126, 5, 5);      
      break;
    case 58:
      ellipse(333, 185, 5, 5); 
      ellipse(385, 140, 5, 5);   
      ellipse(408, 207, 5, 5);
      ellipse(279, 182, 5, 5);      
      break;
    case 59:
      ellipse(339, 190, 5, 5); 
      ellipse(400, 146, 5, 5);   
      ellipse(335, 167, 5, 5);  
      ellipse(279, 207, 5, 5);      
      break;
    case 60:
      ellipse(343, 190, 5, 5);   
      ellipse(342, 207, 5, 5);  
      ellipse(341, 195, 5, 5);      
      ellipse(471, 207, 5, 5);      
      break;
    case 61:
      ellipse(402, 183, 5, 5); 
      ellipse(334, 191, 5, 5); 
      ellipse(350, 210, 5, 5);
      ellipse(113, 193, 5, 5);      
      break;
    case 62:
      ellipse(385, 189, 5, 5);    
      ellipse(417, 179, 5, 5); 
      ellipse(407, 180, 5, 5); 
      ellipse(113, 273, 5, 5);           
      break;
    case 63:
      ellipse(370, 178, 5, 5);    
      ellipse(338, 175, 5, 5);   
      ellipse(357, 195, 5, 5); 
      ellipse(637, 213, 5, 5);      
      break;
    case 64:
      ellipse(367, 148, 5, 5);   
      ellipse(400, 210, 5, 5);      
      ellipse(375, 187, 5, 5);  
      ellipse(637, 238, 5, 5);      
      break;
    case 65:
      ellipse(180, 162, 5, 5);  
      ellipse(343, 180, 5, 5);  
      ellipse(367, 183, 5, 5);      
      ellipse(637, 278, 5, 5);         
      break;
    case 66:
      ellipse(570, 217, 5, 5); 
      ellipse(361, 190, 5, 5);  
      ellipse(381, 153, 5, 5);      
      ellipse(323, 177, 5, 5);      
      break;
    case 67:
      ellipse(570, 147, 5, 5);    
      ellipse(375, 178, 5, 5);    
      ellipse(570, 230, 5, 5);     
      ellipse(349, 136, 5, 5);          
      break;
    case 68:
      ellipse(230, 156, 5, 5);  
      ellipse(362, 148, 5, 5); 
      ellipse(570, 177, 5, 5);      
      ellipse(415, 204, 5, 5);      
      break;
    case 69:
      ellipse(520, 86, 5, 5);    
      ellipse(180, 177, 5, 5);      
      ellipse(570, 142, 5, 5);  
      ellipse(230, 96, 5, 5);      
      break;
    case 70:
      ellipse(570, 177, 5, 5);
      ellipse(520, 259, 5, 5);    
      ellipse(180, 122, 5, 5);
      ellipse(416, 159, 5, 5);      
      break;
    case 71:
      ellipse(368, 198, 7, 7);    
      break;
    case 72:
      ellipse(402, 235, 7, 7);     
      break;
    case 73:
      ellipse(279, 250, 7, 7);    
      break;
    case 74:
      ellipse(471, 250, 7, 7); 
      ellipse(285, 444, 7, 7);       
      break;
    case 75:
      ellipse(190, 226, 7, 7);    
      ellipse(465, 444, 7, 7);        
      break;      
    case 76:
      ellipse(227, 189, 7, 7); 
      ellipse(512, 368, 7, 7);      
      break;
    case 77:
      ellipse(691, 351, 7, 7);   
      ellipse(348, 235, 7, 7);   
      ellipse(505, 234, 7, 7);      
      break;
    case 78:
      ellipse(300, 410, 7, 7); 
      ellipse(483, 428, 7, 7);  
      ellipse(619, 291, 7, 7);      
      break;
    case 79:
      ellipse(267, 428, 7, 7);
      ellipse(520, 373, 7, 7);   
      ellipse(382, 198, 7, 7);    
      break;
    case 80:
      ellipse(450, 410, 7, 7);  
      ellipse(84, 331, 7, 7);  
      ellipse(556, 196, 7, 7);      
      break;
    case 81:
      ellipse(500, 362, 7, 7);
      ellipse(102, 316, 7, 7); 
      ellipse(375, 376, 7, 7);       
      break;
    case 82:
      ellipse(524, 406, 7, 7);  
      ellipse(138, 286, 7, 7);     
      ellipse(90, 326, 7, 7);      
      break;
    case 83:
      ellipse(508, 269, 7, 7);    
      ellipse(174, 256, 7, 7); 
      ellipse(120, 301, 7, 7);      
      break;
    case 84:
      ellipse(473, 279, 7, 7);
      ellipse(536, 261, 7, 7);   
      ellipse(589, 266, 7, 7);       
      break;
    case 85:
      ellipse(439, 289, 7, 7);
      ellipse(487, 275, 7, 7);
      ellipse(236, 267, 7, 7);      
      break;      
    case 86:
      ellipse(342, 93, 7, 7);  
      ellipse(306, 287, 7, 7);  
      ellipse(312, 289, 7, 7);      
      break;
    case 87:
      ellipse(375, 195, 7, 7);  
      ellipse(523, 189, 7, 7); 
      ellipse(564, 253, 7, 7);     
      break;
    case 88:
      ellipse(245, 234, 7, 7); 
      ellipse(554, 401, 7, 7);     
      ellipse(257, 273, 7, 7);      
      break;
    case 89:
      ellipse(560, 226, 7, 7); 
      ellipse(643, 311, 7, 7); 
      ellipse(194, 196, 7, 7);      
      break;
    case 90:
      ellipse(310, 446, 7, 7);     
      ellipse(126, 296, 7, 7);  
      ellipse(554, 366, 7, 7);         
      break;
    case 91:
      ellipse(353, 174, 2, 2);
      ellipse(397, 172, 2, 2);  
      ellipse(396, 217, 3, 3);      
      break;
    case 92:
      ellipse(355, 173, 2, 2); 
      ellipse(382, 198, 3, 3);   
      ellipse(354, 148, 3, 3);      
      break;
    case 93:
      ellipse(393, 174, 2, 2);
      ellipse(382, 223, 2, 2);      
      ellipse(346, 89, 3, 3);      
      break;
    case 94:
      ellipse(375, 225, 2, 2);
      ellipse(188, 191, 2, 2);   
      ellipse(368, 198, 3, 3);      
      break;
    case 95:
      ellipse(356, 235, 3, 3);
      ellipse(556, 196, 3, 3); 
      ellipse(387, 215, 2, 2);      
      break;
    case 96:
      ellipse(505, 234, 3, 3); 
      ellipse(318, 469, 2, 2);       
      ellipse(184, 188, 3, 3);       
      break;
    case 97:
      ellipse(177, 222, 3, 3);
      ellipse(257, 440, 2, 2);   
      ellipse(562, 191, 2, 2);      
      break;
    case 98:
      ellipse(222, 183, 2, 2);
      ellipse(450, 410, 3, 3);      
      ellipse(315, 461, 2, 2);        
      break;
    case 99:
      ellipse(279, 467, 2, 2); 
      ellipse(430, 474, 3, 3);    
      ellipse(339, 156, 3, 3);      
      break;
    case 100:
      ellipse(248, 452, 3, 3); 
      ellipse(413, 160, 3, 3);     
      ellipse(365, 144, 3, 3);      
      break;
    case 101:
      ellipse(471, 467, 2, 2); 
      ellipse(396, 209, 3, 3);    
      ellipse(395, 171, 2, 2);      
      break;
    case 102:
      ellipse(499, 447, 2, 2); 
      ellipse(364, 180, 3, 3);   
      ellipse(375, 195, 3, 3);       
      break;
    case 103:
      ellipse(375, 376, 3, 3); 
      ellipse(404, 89, 3, 3);    
      ellipse(363, 215, 2, 2);      
      break;
    case 104:
      ellipse(512, 368, 3, 3); 
      ellipse(397, 174, 2, 2);      
      ellipse(194, 196, 3, 3);      
      break;
    case 105:
      ellipse(338, 164, 3, 3);
      ellipse(368, 208, 2, 2);  
      ellipse(567, 224, 2, 2);       
      break;
    case 106:
      ellipse(391, 224, 3, 3);
      ellipse(382, 208, 2, 2);  
      ellipse(528, 183, 2, 2);      
      break;
    case 107:
      ellipse(357, 148, 3, 3);
      ellipse(343, 242, 3, 3);      
      ellipse(285, 444, 3, 3);       
      break;
    case 108:
      ellipse(385, 144, 3, 3);
      ellipse(245, 234, 3, 3);  
      ellipse(267, 428, 3, 3);      
      break;
    case 109:
      ellipse(251, 447, 2, 2); 
      ellipse(182, 224, 2, 2); 
      ellipse(335, 164, 3, 3);      
      break;
    case 110:
      ellipse(469, 459, 2, 2);
      ellipse(573, 222, 3, 3);      
      ellipse(227, 189, 3, 3);      
      break;
    case 111:
      ellipse(500, 362, 3, 3);
      ellipse(320, 474, 3, 3);
      ellipse(531, 179, 3, 3);      
      break;
    case 112:
      ellipse(414, 163, 3, 3);
      ellipse(440, 446, 3, 3);       
      ellipse(281, 459, 2, 2);      
      break;
    case 113:
      ellipse(361, 193, 3, 3);
      ellipse(493, 440, 2, 2);      
      ellipse(465, 444, 3, 3);      
      break;
    case 114:
      ellipse(368, 223, 6, 6);    
      ellipse(382, 223, 6, 6); 
      ellipse(493, 440, 6, 6);       
      break;
    case 115:
      ellipse(182, 224, 6, 6);    
      ellipse(567, 224, 6, 6); 
      ellipse(48, 361, 7, 7);      
      break;
    case 116:
      ellipse(188, 191, 6, 6);    
      ellipse(709, 366, 7, 7);    
      ellipse(679, 341, 7, 7);        
      break;
    case 117:
      ellipse(222, 183, 6, 6);    
      ellipse(685, 346, 7, 7);     
      ellipse(96, 321, 7, 7);      
      break;
    case 118:
      ellipse(562, 191, 6, 6);    
      ellipse(637, 306, 7, 7);     
      ellipse(132, 291, 7, 7);      
      break;
    case 119:
      ellipse(528, 183, 6, 6);   
      ellipse(150, 276, 7, 7);
      ellipse(156, 271, 7, 7);       
      break;
    case 120:
      ellipse(315, 461, 6, 6);     
      ellipse(162, 266, 7, 7);     
      ellipse(557, 255, 7, 7);      
      break;
    case 121:
      ellipse(281, 459, 6, 6);  
      ellipse(194, 255, 7, 7);      
      break;
    case 122:
      ellipse(440, 446, 7, 7);    
      ellipse(515, 267, 7, 7);  
      ellipse(229, 265, 7, 7);      
      break;
    case 123:
      ellipse(469, 459, 6, 6);
      ellipse(494, 273, 7, 7);  
      ellipse(445, 287, 7, 7);      
      break;
    case 124:
      ellipse(66, 346, 7, 7);    
      ellipse(299, 285, 7, 7);  
      ellipse(279, 467, 6, 6);      
      break;
    case 125:
      ellipse(673, 336, 7, 7);     
      ellipse(375, 225, 6, 6);
      ellipse(471, 467, 6, 6);         
      break;
    case 126:
      ellipse(625, 296, 7, 7);
      ellipse(318, 469, 6, 6);     
      ellipse(78, 336, 7, 7);       
      break;
    case 127:
      ellipse(595, 271, 7, 7);    
      ellipse(257, 440, 6, 6);      
      break;
    case 128:
      ellipse(215, 261, 7, 7);   
      ellipse(435, 461, 6, 6);      
      ellipse(631, 301, 7, 7);      
      break;
    case 129:
      ellipse(243, 269, 7, 7);  
      ellipse(432, 469, 6, 6);
      ellipse(601, 276, 7, 7);       
      break;
    case 130:
      ellipse(452, 285, 7, 7);   
      ellipse(251, 447, 6, 6);  
      ellipse(571, 251, 7, 7);      
      break;
    case 131:
      ellipse(408, 93, 7, 7);    
      ellipse(499, 447, 6, 6);  
      ellipse(250, 271, 7, 7);      
      break;
    case 132:
      ellipse(348, 235, 11, 11); 
      ellipse(450, 410, 11, 11);   
      ellipse(295, 181, 11, 11);     
      ellipse(606, 132, 11, 11);      
      break;
    case 133:
      ellipse(402, 235, 11, 11);     
      ellipse(440, 446, 11, 11);   
      ellipse(274, 155, 11, 11);    
      ellipse(624, 146, 11, 11);      
      break;
    case 134:
      ellipse(279, 250, 11, 11);     
      ellipse(465, 444, 11, 11);   
      ellipse(493, 126, 11, 11);   
      ellipse(654, 193, 11, 11);       
      break;
    case 135:
      ellipse(471, 250, 11, 11);    
      ellipse(483, 428, 11, 11);
      ellipse(507, 95, 11, 11);      
      ellipse(85, 226, 11, 11);      
      break;
    case 136:
      ellipse(245, 234, 11, 11);  
      ellipse(375, 376, 11, 11);   
      ellipse(516, 62, 11, 11);      
      ellipse(69, 270, 11, 11);      
      break;
    case 137:
      ellipse(300, 410, 11, 11);  
      ellipse(500, 362, 11, 11);    
      ellipse(525, 69, 11, 11); 
      ellipse(61, 292, 11, 11);      
      break;
    case 138:
      ellipse(285, 444, 11, 11); 
      ellipse(512, 368, 11, 11);       
      ellipse(199, 90, 11, 11);   
      ellipse(714, 358, 11, 11);     
      break;
    case 139:
      ellipse(267, 428, 11, 11);
      ellipse(319, 205, 11, 11);
      ellipse(579, 111, 11, 11);   
      ellipse(49, 325, 11, 11);      
      break;
    case 140:
      ellipse(355, 173, 8, 8);    
      ellipse(200, 226, 8, 8);  
      ellipse(523, 189, 3, 3);  
      ellipse(319, 234, 5, 5);      
      break;
    case 141:
      ellipse(395, 173, 8, 8); 
      ellipse(202, 202, 4, 4); 
      ellipse(483, 428, 3, 3);      
      ellipse(431, 234, 5, 5);       
      break;
    case 142:
      ellipse(550, 226, 8, 8);    
      ellipse(200, 226, 4, 4);    
      ellipse(353, 213, 3, 3); 
      ellipse(395, 228, 5, 5);       
      break;
    case 143:
      ellipse(230, 198, 4, 4); 
      ellipse(558, 406, 4, 4);       
      ellipse(389, 226, 3, 3); 
      ellipse(323, 183, 5, 5);       
      break;
    case 144:
      ellipse(520, 198, 8, 8);    
      ellipse(370, 143, 4, 4);   
      ellipse(396, 148, 3, 3);  
      ellipse(344, 139, 5, 5);      
      break;
    case 145:
      ellipse(520, 198, 4, 4);      
      ellipse(425, 209, 4, 4); 
      ellipse(357, 172, 2, 2); 
      ellipse(395, 222, 5, 5);     
      break;
    case 146:
      ellipse(524, 412, 4, 4);  
      ellipse(202, 202, 8, 8);    
      ellipse(355, 175, 2, 2);  
      ellipse(413, 209, 5, 5);      
      break;
    case 147:
      ellipse(408, 152, 4, 4);     
      ellipse(230, 198, 8, 8);   
      ellipse(368, 223, 2, 2);  
      ellipse(422, 179, 5, 5);      
      break;
    case 148:
      ellipse(319, 234, 13, 13);
      ellipse(200, 226, 12, 12);      
      break;
    case 149:
      ellipse(431, 234, 13, 13);
      ellipse(230, 198, 12, 12);      
      break;
    case 150:
      ellipse(202, 202, 12, 12);   
      ellipse(520, 198, 12, 12);      
      break;
    case 151:
      ellipse(548, 202, 12, 12); 
      ellipse(379, 413, 13, 13);      
      break;
    case 152:
      ellipse(326, 364, 13, 13); 
      ellipse(409, 401, 13, 13);      
      break;
    case 153:
      ellipse(424, 364, 13, 13);   
      ellipse(462, 371, 13, 13);      
      break;
    case 154:
      ellipse(534, 382, 13, 13);
      ellipse(482, 359, 13, 13);      
      break;
    case 155:
      ellipse(330, 112, 13, 13); 
      ellipse(500, 362, 13, 13);       
      break;
    case 156:
      ellipse(420, 112, 13, 13);  
      ellipse(550, 226, 12, 12);      
      break;
    case 157:
      ellipse(355, 228, 5, 5);      
      ellipse(427, 189, 5, 5);  
      ellipse(440, 197, 11, 11); 
      ellipse(703, 361, 7, 7);        
      break;
    case 158:
      ellipse(423, 201, 5, 5);      
      ellipse(411, 142, 5, 5);  
      ellipse(471, 164, 11, 11);
      ellipse(72, 341, 7, 7);       
      break;
    case 159:
      ellipse(391, 131, 5, 5);     
      ellipse(380, 128, 5, 5);  
      ellipse(253, 116, 11, 11);
      ellipse(168, 261, 7, 7);      
      break;
    case 160:
      ellipse(332, 199, 5, 5);    
      ellipse(328, 189, 5, 5);  
      ellipse(238, 73, 11, 11);
      ellipse(201, 257, 7, 7);      
      break;
    case 161:
      ellipse(339, 149, 5, 5); 
      ellipse(422, 174, 5, 5);     
      ellipse(217, 76, 11, 11);
      ellipse(522, 265, 7, 7);      
      break;
    case 162:
      ellipse(370, 139, 5, 5);  
      ellipse(402, 142, 5, 5);  
      ellipse(190, 97, 11, 11);   
      ellipse(271, 277, 7, 7);      
      break;
    case 163:
      ellipse(339, 202, 5, 5);   
      ellipse(380, 139, 5, 5); 
      ellipse(597, 125, 11, 11);   
      ellipse(459, 283, 7, 7);   
      break;
    case 164:
      ellipse(334, 173, 5, 5); 
      ellipse(390, 142, 5, 5); 
      ellipse(642, 160, 11, 11); 
      ellipse(114, 306, 7, 7);      
      break;
    case 165:
      ellipse(403, 205, 5, 5); 
      ellipse(411, 190, 5, 5); 
      ellipse(93, 204, 11, 11);   
      ellipse(144, 281, 7, 7);      
      break;
    case 166:
      ellipse(407, 185, 5, 5); 
      ellipse(406, 200, 5, 5); 
      ellipse(666, 226, 11, 11); 
      ellipse(187, 253, 7, 7);      
      break;
    case 167:
      ellipse(354, 199, 5, 5);    
      ellipse(396, 199, 5, 5);      
      ellipse(682, 270, 11, 11);      
      ellipse(501, 271, 7, 7);      
      break;
    case 168:
      ellipse(370, 188, 5, 5);    
       ellipse(348, 189, 5, 5);     
      ellipse(698, 314, 11, 11);         
      ellipse(285, 281, 7, 7);
      break;
    case 169:
      ellipse(375, 153, 5, 5);   
      ellipse(357, 185, 5, 5);      
      ellipse(718, 369, 11, 11);     
      ellipse(278, 279, 7, 7);      
      break;
    case 170:
      ellipse(570, 207, 5, 5);   
      ellipse(365, 189, 5, 5);
      ellipse(702, 325, 11, 11);       
      ellipse(292, 283, 7, 7);      
      break;
    case 171:
      ellipse(395, 170, 23, 23);  
      ellipse(145, 132, 11, 11);   
      ellipse(359, 131, 5, 5); 
      ellipse(300, 410, 19, 19);      
      break;
    case 172:
      ellipse(395, 173, 2, 2);
      ellipse(97, 193, 11, 11); 
      ellipse(350, 220, 5, 5);   
      ellipse(310, 446, 19, 19);       
      break;
    case 173:
      ellipse(394, 235, 3, 3);   
      ellipse(45, 336, 11, 11);   
      ellipse(353, 139, 5, 5);
      ellipse(450, 410, 19, 19);      
      break;
    case 174:
      ellipse(319, 234, 9, 9);   
      ellipse(649, 316, 7, 7);
      ellipse(411, 202, 5, 5);   
      ellipse(375, 376, 23, 23);       
      break;
    case 175:
      ellipse(431, 234, 21, 21);    
      ellipse(222, 263, 7, 7);  
      ellipse(409, 195, 5, 5); 
      ellipse(409, 401, 17, 17);       
      break;
    case 176:
      ellipse(471, 250, 15, 15);    
      ellipse(180, 240, 5, 5); 
      ellipse(351, 194, 5, 5);  
      ellipse(512, 368, 9, 9);       
      break;
    case 177:
      ellipse(505, 234, 11, 11);  
      ellipse(180, 152, 5, 5);  
      ellipse(372, 183, 5, 5);
      ellipse(525, 398, 9, 9);       
      break;
    case 178:
      ellipse(532, 215, 14, 14);    
      ellipse(570, 212, 5, 5); 
      ellipse(311, 197, 11, 11); 
       ellipse(420, 206, 5, 5);      
      break;
    case 179:
      ellipse(560, 226, 3, 3);    
      ellipse(570, 157, 5, 5);
      ellipse(263, 136, 11, 11);  
      ellipse(375, 128, 5, 5);      
      break;
    case 180:
      ellipse(326, 364, 17, 17); 
      ellipse(230, 111, 5, 5);
      ellipse(226, 69, 11, 11);   
      ellipse(328, 184, 5, 5);      
      break;
    case 181:
      ellipse(310, 446, 11, 11);     
      ellipse(230, 161, 5, 5);
      ellipse(588, 118, 11, 11);    
      ellipse(414, 154, 5, 5);      
      break;
    case 182:
      ellipse(278, 472, 3, 3); 
      ellipse(520, 116, 5, 5);  
      ellipse(529, 263, 7, 7);  
      ellipse(346, 149, 4, 4);      
      break;
    case 183:
      ellipse(435, 461, 2, 2);  
      ellipse(279, 273, 5, 5); 
      ellipse(180, 172, 5, 5);   
      ellipse(333, 179, 5, 5);      
      break;
    case 184:
      ellipse(379, 413, 9, 9);  
      ellipse(113, 203, 5, 5);     
      ellipse(570, 187, 5, 5);  
      ellipse(352, 205, 5, 5);      
      break;
    case 185:
      ellipse(462, 371, 17, 17);    
      ellipse(113, 238, 5, 5); 
      ellipse(230, 116, 5, 5);  
      ellipse(355, 202, 3, 3);      
      break;
    case 186:
      ellipse(548, 394, 9, 9);   
      ellipse(113, 299, 5, 5);    
      ellipse(230, 254, 5, 5);    
      ellipse(407, 190, 5, 5);      
      break;
    case 187:
      ellipse(330, 206, 5, 5); 
      ellipse(637, 283, 5, 5); 
      ellipse(520, 161, 5, 5); 
      ellipse(383, 183, 5, 5);      
      break;
    case 188:
      ellipse(370, 128, 5, 5);
      ellipse(335, 100, 9, 9);     
      ellipse(471, 177, 5, 5); 
      ellipse(372, 148, 5, 5);      
      break;
    case 189:
      ellipse(328, 179, 5, 5);   
      ellipse(393, 172, 2, 2);  
      ellipse(113, 263, 5, 5);   
      ellipse(464, 173, 11, 11);      
      break;
    case 190:
      ellipse(360, 142, 5, 5); 
      ellipse(319, 234, 21, 21);  
      ellipse(637, 193, 5, 5);
      ellipse(543, 83, 11, 11);      
      break;
    case 191:
      ellipse(412, 170, 3, 3);    
      ellipse(279, 250, 19, 19); 
      ellipse(330, 112, 15, 15);      
      ellipse(163, 118, 11, 11);      
      break;
    case 192:
      ellipse(361, 226, 3, 3);  
      ellipse(548, 202, 4, 4);      
      ellipse(340, 126, 17, 17); 
      ellipse(65, 281, 11, 11);     
      break;
    case 193:
      ellipse(395, 190, 5, 5);  
      ellipse(424, 364, 9, 9);   
      ellipse(357, 174, 2, 2);
     ellipse(710, 347, 11, 11);       
      break;
    case 194:
      ellipse(384, 179, 3, 3); 
      ellipse(285, 444, 19, 19);  
      ellipse(375, 220, 3, 3);      
      ellipse(661, 326, 7, 7);       
      break;
    case 195:
      ellipse(369, 153, 5, 5); 
      ellipse(435, 461, 10, 10);   
      ellipse(431, 234, 9, 9);    
      ellipse(607, 281, 7, 7);       
      break;
    case 196:
      ellipse(456, 181, 11, 11); 
      ellipse(379, 413, 21, 21); 
      ellipse(471, 250, 19, 19); 
      ellipse(543, 259, 7, 7);      
      break;
    case 197:
      ellipse(483, 146, 11, 11);  
      ellipse(482, 359, 17, 17); 
      ellipse(218, 215, 14, 14);     
      ellipse(180, 207, 5, 5);      
      break;
    case 198:
      ellipse(503, 106, 11, 11); 
      ellipse(534, 382, 23, 23);  
      ellipse(550, 226, 4, 4); 
      ellipse(570, 182, 5, 5);        
      break;
    case 199:
      ellipse(552, 90, 11, 11);  
      ellipse(417, 211, 5, 5);      
      ellipse(326, 364, 9, 9);      
      ellipse(230, 121, 5, 5);      
      break;
    case 200:
      ellipse(375, 325, 10, 10); 
      ellipse(450, 410, 31, 31);  
      ellipse(344, 228, 3, 3);
      ellipse(393, 185, 5, 5);      
      break;
    case 201:
      ellipse(355, 165, 30, 30);  
      ellipse(377, 163, 4, 4); 
      ellipse(279, 250, 39, 39);
      ellipse(448, 189, 11, 11);       
      break;
    case 202:
      ellipse(355, 170, 21, 21); 
      ellipse(280, 164, 11, 11);
      ellipse(471, 250, 31, 31); 
      ellipse(570, 104, 11, 11);      
      break;
    case 203:
      ellipse(395, 165, 30, 30); 
      ellipse(534, 76, 11, 11);
      ellipse(505, 234, 27, 27); 
      ellipse(89, 215, 11, 11);       
      break;
    case 204:
      ellipse(353, 172, 2, 2);    
      ellipse(650, 182, 11, 11);
      ellipse(218, 215, 28, 28); 
      ellipse(674, 248, 11, 11);      
      break;
    case 205:
      ellipse(375, 210, 37, 37);     
      ellipse(73, 259, 11, 11);
      ellipse(326, 364, 41, 41);
      ellipse(180, 245, 5, 5);      
      break;
    case 206:
      ellipse(348, 235, 3, 3); 
      ellipse(54, 356, 7, 7); 
      ellipse(326, 364, 25, 25);
      ellipse(180, 147, 5, 5);        
      break;
    case 207:
      ellipse(319, 234, 41, 41);
      ellipse(180, 251, 7, 7);  
      ellipse(300, 410, 43, 43);
      ellipse(570, 197, 5, 5);      
      break;
    case 208:
      ellipse(319, 234, 29, 29);   
      ellipse(180, 230, 5, 5);
      ellipse(257, 440, 10, 10);
      ellipse(520, 91, 5, 5);      
      break;
    case 209:
      ellipse(431, 234, 41, 41); 
      ellipse(180, 142, 5, 5); 
      ellipse(285, 444, 15, 15); 
      ellipse(520, 156, 5, 5);      
      break;
    case 210:
      ellipse(431, 234, 17, 17);   
      ellipse(570, 192, 5, 5);
      ellipse(450, 410, 23, 23);
      ellipse(471, 192, 5, 5);      
      break;
    case 211:
      ellipse(471, 250, 37, 37);    
      ellipse(230, 91, 5, 5);
      ellipse(375, 376, 35, 35);
      ellipse(637, 183, 5, 5);      
      break;
    case 212:
      ellipse(245, 234, 33, 33);
      ellipse(520, 76, 5, 5);      
      ellipse(409, 401, 25, 25);
      ellipse(637, 268, 5, 5);       
      break;
    case 213:
      ellipse(245, 234, 19, 19); 
      ellipse(520, 131, 5, 5);
      ellipse(405, 223, 5, 5);
      ellipse(319, 234, 25, 25);      
      break;
    case 214:
      ellipse(505, 234, 23, 23);
      ellipse(279, 197, 5, 5);
      ellipse(354, 133, 5, 5); 
      ellipse(279, 250, 31, 31);      
      break;
    case 215:
      ellipse(218, 215, 22, 22);   
      ellipse(471, 202, 5, 5);
      ellipse(343, 145, 5, 5);
      ellipse(218, 215, 26, 26);      
      break;
    case 216:
      ellipse(532, 215, 10, 10); 
      ellipse(113, 223, 5, 5); 
      ellipse(336, 197, 5, 5);
      ellipse(310, 446, 15, 15);      
      break;
    case 217:
     ellipse(326, 364, 49, 49);  
      ellipse(637, 168, 5, 5);
      ellipse(401, 200, 5, 5);
      ellipse(440, 446, 15, 15);      
      break;
    case 218:
      ellipse(326, 364, 21, 21);
      ellipse(637, 233, 5, 5);
      ellipse(378, 183, 5, 5); 
      ellipse(375, 376, 27, 27);       
      break;
    case 219:
      ellipse(424, 364, 41, 41);    
      ellipse(410, 126, 19, 19);
      ellipse(380, 143, 4, 4);   
      ellipse(379, 413, 31, 31);      
      break;
    case 220:
      ellipse(300, 410, 47, 47);   
      ellipse(415, 100, 9, 9);     
      ellipse(241, 84, 11, 11);
      ellipse(462, 371, 23, 23);      
      break;
    case 221:
      ellipse(300, 410, 23, 23);
      ellipse(355, 170, 23, 23);
      ellipse(420, 169, 5, 5);
      ellipse(349, 200, 5, 5);      
      break;
    case 222:
      ellipse(267, 428, 19, 19); 
      ellipse(355, 171, 2, 2);  
      ellipse(615, 139, 11, 11); 
      ellipse(498, 116, 11, 11);      
      break;
    case 223:
      ellipse(450, 410, 27, 27); 
      ellipse(407, 242, 3, 3);
      ellipse(662, 215, 11, 11); 
      ellipse(378, 158, 5, 5);      
      break;
    case 224:
      ellipse(465, 444, 19, 19);
      ellipse(431, 234, 37, 37); 
      ellipse(181, 104, 11, 11);
      ellipse(670, 237, 11, 11);      
      break;
    case 225:
      ellipse(375, 376, 31, 31);   
      ellipse(279, 250, 27, 27); 
      ellipse(686, 281, 11, 11);
      ellipse(655, 321, 7, 7);       
      break;
    case 226:
      ellipse(409, 401, 21, 21);
      ellipse(471, 250, 23, 23);
      ellipse(41, 347, 11, 11);
      ellipse(466, 281, 7, 7);      
      break;
    case 227:
      ellipse(482, 359, 9, 9); 
      ellipse(218, 215, 30, 30);
      ellipse(180, 182, 5, 5); 
      ellipse(230, 76, 5, 5);     
      break;
    case 228:
      ellipse(559, 364, 4, 4);    
      ellipse(532, 215, 22, 22); 
      ellipse(583, 261, 7, 7);
      ellipse(520, 166, 5, 5);      
      break;
    case 229:
      ellipse(327, 201, 5, 5);     
      ellipse(326, 364, 29, 29); 
      ellipse(480, 277, 7, 7);
      ellipse(113, 173, 5, 5);      
      break;
    case 230:
      ellipse(335, 146, 5, 5);
      ellipse(424, 364, 37, 37);
      ellipse(113, 288, 5, 5);  
      ellipse(431, 234, 29, 29);      
      break;
    case 231:
      ellipse(355, 222, 5, 5);
      ellipse(424, 364, 25, 25);
      ellipse(180, 197, 5, 5);
      ellipse(505, 234, 31, 31);      
      break;
    case 232:
      ellipse(420, 194, 5, 5);   
      ellipse(300, 410, 15, 15);
      ellipse(570, 245, 5, 5);
      ellipse(424, 364, 47, 47);      
      break;
    case 233:
      ellipse(387, 135, 5, 5); 
      ellipse(450, 410, 47, 47);  
      ellipse(230, 81, 5, 5);  
      ellipse(450, 410, 43, 43);      
      break;
    case 234:
      ellipse(350, 215, 5, 5);  
      ellipse(432, 469, 2, 2); 
      ellipse(520, 111, 5, 5);
      ellipse(379, 413, 25, 25);        
      break;
    case 235:
      ellipse(412, 180, 5, 5);    
      ellipse(379, 413, 29, 29); 
      ellipse(279, 172, 5, 5); 
      ellipse(418, 151, 5, 5);       
      break;
    case 236:
      ellipse(325, 209, 4, 4);
      ellipse(462, 371, 21, 21);
      ellipse(471, 182, 5, 5);
      ellipse(397, 139, 5, 5);      
      break;
    case 237:
      ellipse(287, 173, 11, 11);  
      ellipse(534, 382, 25, 25);
      ellipse(471, 273, 5, 5);
      ellipse(388, 184, 5, 5);       
      break;
    case 238:
      ellipse(248, 106, 11, 11);   
      ellipse(370, 232, 5, 5);    
      ellipse(113, 233, 5, 5); 
      ellipse(488, 136, 11, 11);      
      break;
    case 239:
      ellipse(235, 62, 11, 11);  
      ellipse(327, 161, 5, 5); 
      ellipse(637, 188, 5, 5);
       ellipse(208, 83, 11, 11);     
      break;
    case 240:
      ellipse(127, 146, 11, 11);   
      ellipse(329, 156, 5, 5);
      ellipse(637, 258, 5, 5);
      ellipse(109, 160, 11, 11);       
      break;
    case 241:
      ellipse(646, 171, 11, 11);
      ellipse(330, 194, 5, 5);  
      ellipse(335, 100, 11, 11); 
      ellipse(694, 303, 11, 11);      
      break;
    case 242:
      ellipse(42, 366, 7, 7);       
      ellipse(418, 164, 5, 5); 
      ellipse(402, 235, 3, 3);
      ellipse(264, 275, 7, 7);      
      break;
    case 243:
      ellipse(613, 286, 7, 7);  
      ellipse(342, 152, 4, 4);
      ellipse(431, 234, 33, 33);
      ellipse(180, 202, 5, 5);      
      break;
    case 244:
      ellipse(208, 259, 7, 7);   
      ellipse(354, 217, 3, 3);
      ellipse(279, 250, 23, 23);
      ellipse(570, 202, 5, 5);      
      break;
    case 245:
      ellipse(570, 235, 5, 5);    
      ellipse(354, 209, 3, 3);
      ellipse(245, 234, 31, 31);
      ellipse(570, 132, 5, 5);      
      break;
    case 246:
      ellipse(570, 152, 5, 5);
      ellipse(393, 195, 5, 5);
      ellipse(505, 234, 19, 19); 
      ellipse(520, 141, 5, 5);      
      break;
    case 247:
      ellipse(570, 117, 5, 5);  
      ellipse(353, 185, 5, 5);
      ellipse(532, 215, 28, 28);
      ellipse(113, 178, 5, 5);      
      break;
    case 248:
      ellipse(230, 131, 5, 5);
      ellipse(373, 163, 4, 4);
      ellipse(326, 364, 45, 45);  
      ellipse(637, 203, 5, 5);      
      break;
    case 249:
      ellipse(230, 176, 5, 5);    
      ellipse(303, 189, 11, 11);
      ellipse(424, 364, 33, 33);
      ellipse(637, 223, 5, 5);      
      break;
    case 250:
      ellipse(520, 121, 5, 5);  
      ellipse(258, 126, 11, 11); 
      ellipse(300, 410, 39, 39);
      ellipse(471, 250, 39, 39);     
      break;
    case 251:
      ellipse(520, 176, 5, 5);  
      ellipse(561, 97, 11, 11);       
      ellipse(450, 410, 35, 35); 
      ellipse(532, 215, 30, 30);      
      break;
    case 252:
      ellipse(279, 227, 5, 5);    
      ellipse(633, 153, 11, 11);
      ellipse(483, 428, 19, 19);
      ellipse(424, 364, 29, 29);      
      break;
    case 253:
      ellipse(471, 227, 5, 5);  
      ellipse(690, 292, 11, 11);
      ellipse(375, 376, 39, 39);
      ellipse(469, 459, 10, 10);      
      break;
    case 254:
      ellipse(113, 218, 5, 5);    
      ellipse(37, 358, 11, 11);
      ellipse(379, 413, 17, 17);
      ellipse(348, 142, 5, 5);      
      break;
    case 255:
      ellipse(113, 293, 5, 5);    
      ellipse(108, 311, 7, 7);
      ellipse(534, 382, 21, 21);
      ellipse(399, 194, 5, 5);       
      break;
    case 256:
      ellipse(637, 198, 5, 5);    
      ellipse(180, 137, 5, 5);
      ellipse(333, 211, 5, 5);
      ellipse(136, 139, 11, 11);       
      break;
    case 257:
      ellipse(637, 248, 5, 5);
      ellipse(570, 127, 5, 5); 
      ellipse(339, 142, 5, 5);
      ellipse(33, 369, 11, 11);       
      break;
    case 258:
      ellipse(340, 126, 19, 19);
      ellipse(230, 106, 5, 5);      
      ellipse(378, 133, 5, 5); 
      ellipse(180, 187, 5, 5);       
      break;
    case 259:
      ellipse(415, 100, 11, 11);    
      ellipse(520, 96, 5, 5);  
      ellipse(344, 200, 5, 5);
      ellipse(230, 141, 5, 5);      
      break;
    case 260:
      ellipse(355, 165, 32, 32); 
      ellipse(279, 177, 5, 5); 
      ellipse(348, 183, 5, 5);
      ellipse(520, 254, 5, 5);      
      break;
    case 261:
      ellipse(395, 170, 21, 21);
      ellipse(471, 222, 5, 5);
      ellipse(362, 184, 5, 5);
      ellipse(113, 208, 5, 5);      
      break;
    case 262:
      ellipse(395, 175, 2, 2); 
      ellipse(113, 228, 5, 5);
      ellipse(366, 179, 3, 3); 
      ellipse(113, 283, 5, 5);      
      break;
    case 263:
      ellipse(319, 234, 43, 43); 
      ellipse(637, 173, 5, 5); 
      ellipse(393, 148, 3, 3);
      ellipse(637, 299, 5, 5);      
      break;
    case 264:
      ellipse(319, 234, 17, 17);     
      ellipse(637, 263, 5, 5); 
      ellipse(510, 84, 11, 11);  
      ellipse(471, 250, 35, 35);       
      break;
    case 265:
      ellipse(279, 250, 35, 35); 
      ellipse(410, 126, 17, 17);
      ellipse(118, 153, 11, 11);
      ellipse(326, 364, 33, 33);      
      break;
    case 266:
      ellipse(471, 250, 27, 27); 
      ellipse(395, 165, 32, 32); 
      ellipse(658, 204, 11, 11);
      ellipse(379, 413, 33, 33);       
      break;
    case 267:
      ellipse(505, 234, 33, 33);
      ellipse(375, 210, 39, 39);
      ellipse(57, 303, 11, 11);
      ellipse(422, 189, 5, 5);      
      break;
    case 268:
      ellipse(218, 215, 10, 10);
      ellipse(406, 228, 3, 3);
      ellipse(53, 314, 11, 11);
      ellipse(417, 185, 5, 5);      
      break;
    case 269:
      ellipse(326, 364, 37, 37);
      ellipse(319, 234, 37, 37); 
      ellipse(697, 356, 7, 7);
      ellipse(268, 146, 11, 11);      
      break;
    case 270:
      ellipse(424, 364, 49, 49);
      ellipse(431, 234, 43, 43);
      ellipse(550, 257, 7, 7);
      ellipse(154, 125, 11, 11);      
      break;
    case 271:
      ellipse(424, 364, 21, 21); 
      ellipse(431, 234, 25, 25); 
      ellipse(570, 167, 5, 5);
      ellipse(678, 259, 11, 11);      
      break;
    case 272:
      ellipse(300, 410, 35, 35);    
      ellipse(279, 250, 37, 37);
      ellipse(230, 146, 5, 5);
      ellipse(180, 127, 5, 5);      
      break;
    case 273:
      ellipse(315, 461, 10, 10); 
      ellipse(279, 250, 15, 15); 
      ellipse(520, 81, 5, 5); 
      ellipse(570, 162, 5, 5);      
      break;
    case 274:
      ellipse(267, 428, 15, 15);
      ellipse(245, 234, 35, 35);
      ellipse(279, 217, 5, 5);
      ellipse(230, 259, 5, 5);      
      break;
    case 275:
      ellipse(450, 410, 39, 39);
      ellipse(245, 234, 15, 15); 
      ellipse(113, 198, 5, 5); 
      ellipse(471, 197, 5, 5);      
      break;
    case 276:
      ellipse(465, 444, 15, 15);
      ellipse(505, 234, 15, 15);
      ellipse(113, 278, 5, 5);
      ellipse(113, 243, 5, 5);       
      break;
    case 277:
      ellipse(493, 440, 10, 10); 
      ellipse(218, 215, 18, 18); 
      ellipse(420, 112, 15, 15); 
      ellipse(637, 243, 5, 5);       
      break;
    case 278:
      ellipse(375, 376, 15, 15); 
      ellipse(548, 202, 8, 8);
      ellipse(637, 218, 5, 5);
      ellipse(245, 234, 23, 23);      
      break;
    case 279:
      ellipse(409, 401, 9, 9);
      ellipse(424, 364, 17, 17);
      ellipse(319, 234, 33, 33); 
      ellipse(326, 364, 47, 47);      
      break;
    case 280:
      ellipse(482, 359, 19, 19); 
      ellipse(300, 410, 31, 31);
      ellipse(245, 234, 27, 27);
      ellipse(375, 376, 37, 37);      
      break;
    case 281:
      ellipse(534, 382, 17, 17);
      ellipse(281, 459, 10, 10);
      ellipse(532, 215, 26, 26);
      ellipse(482, 359, 21, 21);      
      break;
    case 282:
      ellipse(534, 382, 9, 9);  
      ellipse(450, 410, 15, 15);
      ellipse(424, 364, 45, 45);
      ellipse(363, 135, 5, 5);      
      break;
    case 283:
      ellipse(323, 171, 5, 5); 
      ellipse(375, 376, 19, 19); 
      ellipse(300, 410, 27, 27);
      ellipse(513, 73, 11, 11);       
      break;
    case 284:
      ellipse(405, 218, 5, 5);
      ellipse(462, 371, 9, 9); 
      ellipse(440, 446, 19, 19); 
      ellipse(81, 237, 11, 11);      
      break;
    case 285:
      ellipse(404, 149, 4, 4);
      ellipse(500, 362, 15, 15);  
      ellipse(483, 428, 15, 15);
      ellipse(667, 331, 7, 7);      
      break;
    case 286:
      ellipse(338, 185, 5, 5);
      ellipse(340, 214, 5, 5);
      ellipse(409, 401, 27, 27); 
      ellipse(180, 212, 5, 5);      
      break;
    case 287:
      ellipse(397, 213, 3, 3);
      ellipse(411, 149, 5, 5);   
      ellipse(427, 177, 5, 5);
      ellipse(230, 171, 5, 5);      
      break;
    case 288:
      ellipse(398, 205, 5, 5); 
      ellipse(359, 224, 3, 3);
      ellipse(336, 154, 5, 5); 
      ellipse(570, 122, 5, 5);      
      break;
    case 289:
      ellipse(386, 180, 3, 3);
      ellipse(372, 173, 5, 5);
      ellipse(412, 175, 5, 5); 
      ellipse(279, 202, 5, 5);      
      break;
    case 290:
      ellipse(505, 234, 35, 35); 
      ellipse(637, 208, 5, 5);
      ellipse(244, 95, 11, 11);       
      break;
    case 291:
      ellipse(532, 215, 18, 18); 
      ellipse(300, 410, 55, 55);
      ellipse(520, 146, 5, 5);       
      break;
    case 292:
      ellipse(300, 410, 51, 51);
      ellipse(332, 164, 5, 5);
      ellipse(432, 205, 11, 11);      
      break;
    case 293:
      ellipse(409, 401, 29, 29);
      ellipse(172, 111, 11, 11);
      ellipse(706, 336, 11, 11);       
      break;
    case 294:
      ellipse(337, 160, 3, 3);
      ellipse(60, 351, 7, 7);
      ellipse(230, 86, 5, 5);      
      break;
    case 295:
      ellipse(477, 155, 11, 11);
      ellipse(180, 117, 5, 5);
      ellipse(471, 217, 5, 5);        
      break;
    case 296:
      ellipse(101, 182, 11, 11);
      ellipse(520, 171, 5, 5);
      ellipse(450, 410, 53, 53);       
      break;
    case 297:
      ellipse(577, 256, 7, 7); 
      ellipse(300, 410, 53, 53); 
      ellipse(350, 146, 5, 5); 
      ellipse(395, 144, 5, 5);        
      break;
    case 298:
      ellipse(180, 112, 5, 5);
      ellipse(450, 410, 51, 51);
      ellipse(230, 249, 5, 5);
      ellipse(546, 369, 9, 9);       
      break;
    case 299:
      ellipse(471, 172, 5, 5);
      ellipse(346, 195, 5, 5); 
      ellipse(462, 371, 25, 25);
      ellipse(77, 248, 11, 11);      
      break;
    case 300:
      ellipse(113, 213, 5, 5);
      ellipse(180, 157, 5, 5);
      ellipse(105, 171, 11, 11);
      ellipse(180, 217, 5, 5);       
      break;
    case 301:
      ellipse(375, 295, 118, 118);     
      break;
    case 302: 
      ellipse(375, 295, 116, 116);
      ellipse(113, 248, 5, 5);       
      break;
    case 303:
      ellipse(375, 295, 112, 112); 
      ellipse(450, 410, 55, 55);      
      break;
    case 304:
      ellipse(375, 295, 108, 108);      
      break;
    case 305:
      ellipse(375, 295, 104, 104);      
      break;
    case 306:
      ellipse(375, 295, 100, 100);      
      break;
    case 307:
      ellipse(375, 295, 96, 96); 
      ellipse(375, 180, 110, 110);      
      break;
    case 308:
      ellipse(375, 295, 92, 92);
      ellipse(375, 180, 108, 108);       
      break;
    case 309:
      ellipse(375, 295, 88, 88);    
      break;
    case 310: 
      noLoop();
      break;
  }
  frame++; 
  if (pause > 100) {
    pause = pause - 25;
  }
  delay(pause);
}

