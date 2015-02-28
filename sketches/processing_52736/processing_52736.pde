
// L BLOCK -------------------------------------------------------------------------------------------

int[][] lblock_properties = {{3,4}}; // block_height (karelere göre 3x3), block_no

int[][] lblock1_numbering = {{0,0}}; // shape_number, stage_number
int[][] lblock1 = {{1, 0, 0},{1, 0, 0},{1, 1, 0}};
int[][] lblock1_base = {{0, 2},{1, 2}};
int[][] lblock1_left = {{0, 0},{0, 1},{0, 2}};
int[][] lblock1_right = {{0, 0},{0,1},{1,2}};
int[][] lblock1_places = {{0,0},{0,1},{0,2},{1,2}};

int[][] lblock2_numbering = {{0,1}}; // shape_number, stage_number
int[][] lblock2 = {{0, 0, 0},{0, 0, 1},{1, 1, 1}};
int[][] lblock2_base = {{0, 2},{1, 2},{2,2}};
int[][] lblock2_left = {{0, 2},{2, 1}};
int[][] lblock2_right = {{2, 1},{2,2}};
int[][] lblock2_places = {{0,2},{1,2},{2,2},{2,1}};

int[][] lblock3_numbering = {{0,2}}; // shape_number, stage_number
int[][] lblock3 = {{1,1,0},{0,1,0},{0,1,0}};
int[][] lblock3_base = {{0,0},{1,2}};
int[][] lblock3_left = {{0, 0},{1, 1},{1,2}};
int[][] lblock3_right = {{1, 0},{1, 1},{1, 2}};
int[][] lblock3_places = {{0, 0},{1, 0},{1, 1},{1, 2}};

int[][] lblock4_numbering = {{0,3}}; // shape_number, stage_number
int[][] lblock4 = {{1,1,1},{1,0,0},{0,0,0}};
int[][] lblock4_base = {{0,1},{1,0},{2,0}};
int[][] lblock4_left = {{0, 0},{0, 1}};
int[][] lblock4_right = {{0, 1},{2,0}};
int[][] lblock4_places = {{0,0},{1,0},{2,0},{0,1}};

int[][] llblock1_numbering = {{1,0}}; // shape_number, stage_number
int[][] llblock1 = {{0, 1, 0},{0, 1, 0},{1, 1, 0}};
int[][] llblock1_base = {{0, 2},{1, 2}};
int[][] llblock1_left = {{1, 0},{1, 1},{0, 2}};
int[][] llblock1_right = {{1, 0},{1, 1},{1, 2}};
int[][] llblock1_places = {{1, 0},{1, 1},{0, 2},{1, 2}};

int[][] llblock2_numbering = {{1,1}}; // shape_number, stage_number
int[][] llblock2 = {{0, 0, 0},{1, 1, 1},{0, 0, 1}};
int[][] llblock2_base = {{0, 1},{1, 1},{2, 2}};
int[][] llblock2_left = {{0, 1},{2, 2}};
int[][] llblock2_right = {{2, 1},{2, 2}};
int[][] llblock2_places = {{0, 1},{1, 1},{2, 1},{2, 2}};

int[][] llblock3_numbering = {{1,2}}; // shape_number, stage_number
int[][] llblock3 = {{1, 1, 0},{1, 0, 0},{1, 0, 0}};
int[][] llblock3_base = {{0, 2},{1, 0}};
int[][] llblock3_left = {{0, 0},{0, 1},{0, 2}};
int[][] llblock3_right = {{1, 0},{0, 1},{0, 2}};
int[][] llblock3_places = {{0, 0},{1, 0},{0, 1},{0, 2}};

int[][] llblock4_numbering = {{1,3}}; // shape_number, stage_number
int[][] llblock4 = {{1, 0, 0},{1, 1, 1},{0, 0, 0}};
int[][] llblock4_base = {{0, 1},{1, 1},{2, 1}};
int[][] llblock4_left = {{0, 0},{0, 1}};
int[][] llblock4_right = {{0, 0},{2, 1}};
int[][] llblock4_places = {{0, 0},{0, 1},{1, 1},{2, 1}};

// S BLOCK -------------------------------------------------------------------------------------------

int[][] sblock_properties = {{2,4}}; // block_height (karelere göre 3x3), block_no

int[][] sblock1_numbering = {{2,0}}; // shape_number, stage_number
int[][] sblock1 = {{1, 1},{1, 1}};
int[][] sblock1_base = {{0, 1},{1, 1}};
int[][] sblock1_left = {{0, 0},{0, 1}};
int[][] sblock1_right = {{1, 0},{1, 1}};
int[][] sblock1_places = {{0, 0},{0, 1},{1, 0},{1, 1}};

// Z BLOCK -------------------------------------------------------------------------------------------

int[][] zblock_properties = {{3,4}}; // block_height (karelere göre 3x3), block_no

int[][] zblock1_numbering = {{3,0}}; // shape_number, stage_number
int[][] zblock1 = {{1, 1, 0},{0, 1, 1},{0, 0, 0}};
int[][] zblock1_base = {{0, 0},{1, 1}, {2, 1}};
int[][] zblock1_left = {{0, 0},{1, 1}};
int[][] zblock1_right = {{1, 0},{2, 1}};
int[][] zblock1_places = {{0, 0},{1, 0},{1, 1},{2, 1}};

int[][] zblock2_numbering = {{3,1}}; // shape_number, stage_number
int[][] zblock2 = {{0, 1, 0},{1, 1, 0},{1, 0, 0}};
int[][] zblock2_base = {{0, 2},{1, 1}};
int[][] zblock2_left = {{1, 0},{0, 1},{0, 2}};
int[][] zblock2_right = {{1, 0},{1, 1},{0, 2}};
int[][] zblock2_places = {{1, 0},{1, 1},{0, 1},{0, 2}};

int[][] zzblock1_numbering = {{4,0}}; // shape_number, stage_number
int[][] zzblock1 = {{0, 1, 1},{1, 1, 0},{0, 0, 0}};
int[][] zzblock1_base = {{0, 1},{1, 1}, {2, 0}};
int[][] zzblock1_left = {{1, 0},{0, 1}};
int[][] zzblock1_right = {{2, 0},{1, 1}};
int[][] zzblock1_places = {{1, 0},{2, 0},{0, 1},{1, 1}};

int[][] zzblock2_numbering = {{4,1}}; // shape_number, stage_number
int[][] zzblock2 = {{1, 0, 0},{1, 1, 0},{0, 1, 0}};
int[][] zzblock2_base = {{0, 1},{1, 2}};
int[][] zzblock2_left = {{0, 0},{0, 1},{1, 2}};
int[][] zzblock2_right = {{0, 0},{1, 1},{1, 2}};
int[][] zzblock2_places = {{0, 0},{0, 1},{1, 1},{2, 2}};

// T BLOCK -------------------------------------------------------------------------------------------

int[][] tblock_properties = {{3,4}}; // block_height (karelere göre 3x3), block_no

int[][] tblock1_numbering = {{5,0}}; // shape_number, stage_number
int[][] tblock1 = {{0, 0, 0},{0, 1, 0},{1, 1, 1}};
int[][] tblock1_base = {{0, 2},{1, 2},{2, 2}};
int[][] tblock1_left = {{0, 2},{1, 1}};
int[][] tblock1_right = {{2, 2},{1, 1}};
int[][] tblock1_places = {{0, 2},{1, 1},{1, 2},{2, 2}};

int[][] tblock2_numbering = {{5,1}}; // shape_number, stage_number
int[][] tblock2 = {{0, 1, 0},{1, 1, 0},{0, 1, 0}};
int[][] tblock2_base = {{0, 1},{1, 2}};
int[][] tblock2_left = {{1, 0},{0, 1},{1, 2}};
int[][] tblock2_right = {{1, 0},{1, 1},{1, 2}};
int[][] tblock2_places = {{1, 0},{1, 1},{1, 2},{0, 1}};

int[][] tblock3_numbering = {{5,2}}; // shape_number, stage_number
int[][] tblock3 = {{1, 1, 1},{0, 1, 0},{0, 0, 0}};
int[][] tblock3_base = {{0, 0},{1, 1},{2, 0}};
int[][] tblock3_left = {{0, 0},{1, 1}};
int[][] tblock3_right = {{2, 0},{1, 1}};
int[][] tblock3_places = {{0, 0},{1, 0},{1, 1},{2, 0}};

int[][] tblock4_numbering = {{5,2}}; // shape_number, stage_number
int[][] tblock4 = {{1, 0, 0},{1, 1, 0},{1, 0, 0}};
int[][] tblock4_base = {{0, 2},{1, 1}};
int[][] tblock4_left = {{0, 0},{0, 1},{0, 2}};
int[][] tblock4_right = {{0, 0},{1, 1},{0, 2}};
int[][] tblock4_places = {{0, 0},{0, 1},{0, 2},{1, 1}};

// I BLOCK -------------------------------------------------------------------------------------------

int[][] iblock_properties = {{4,4}}; // block_height (karelere göre 3x3), block_no

int[][] iblock1_numbering = {{6,0}}; // shape_number, stage_number
int[][] iblock1 = {{1, 0, 0, 0},{1, 0, 0, 0},{1, 0, 0, 0},{1, 0, 0, 0}};
int[][] iblock1_base = {{0, 3}};
int[][] iblock1_left = {{0, 0},{0, 1},{0, 2},{0, 3}};
int[][] iblock1_right = {{0, 0},{0, 1},{0, 2},{0, 3}};
int[][] iblock1_places = {{0, 0},{0, 1},{0, 2},{0, 3}};

int[][] iblock2_numbering = {{6,1}}; // shape_number, stage_number
int[][] iblock2 = {{0, 0, 0, 0},{1, 1, 1, 1},{0, 0, 0, 0},{0, 0, 0, 0}};
int[][] iblock2_base = {{0, 1},{1, 1},{2, 1},{3, 1}};
int[][] iblock2_left = {{0, 1}};
int[][] iblock2_right = {{3, 1}};
int[][] iblock2_places = {{0, 1},{1, 1},{2, 1},{3, 1}};








//SHAPE (0:LBLOCK, 1:SBLOCK)
//  STAGE
//    PROPERTIES {HEIGHT,NO} 0
//    BLOCK_NUMBERING 1
//    BLOCK 2
//    BLOCK-BASE 3
//    BLOCK-LEFT 4
//    BLOCK-RIGHT 5
//    BLOCK-PLACES 6

int[][][][][] rnd = {
  {
{lblock_properties,lblock1_numbering,lblock1,lblock1_base,lblock1_left,lblock1_right,lblock1_places},
{lblock_properties,lblock2_numbering,lblock2,lblock2_base,lblock2_left,lblock2_right,lblock2_places},
{lblock_properties,lblock3_numbering,lblock3,lblock3_base,lblock3_left,lblock3_right,lblock3_places},
{lblock_properties,lblock4_numbering,lblock4,lblock4_base,lblock4_left,lblock4_right,lblock4_places}
  },
  {
{lblock_properties,llblock1_numbering,llblock1,llblock1_base,llblock1_left,llblock1_right,llblock1_places},
{lblock_properties,llblock2_numbering,llblock2,llblock2_base,llblock2_left,llblock2_right,llblock2_places},
{lblock_properties,llblock3_numbering,llblock3,llblock3_base,llblock3_left,llblock3_right,llblock3_places},
{lblock_properties,llblock4_numbering,llblock4,llblock4_base,llblock4_left,llblock4_right,llblock4_places}
  },
  {
{sblock_properties,sblock1_numbering,sblock1,sblock1_base,sblock1_left,sblock1_right,sblock1_places}
  },
  {
{zblock_properties,zblock1_numbering,zblock1,zblock1_base,zblock1_left,zblock1_right,zblock1_places},
{zblock_properties,zblock2_numbering,zblock2,zblock2_base,zblock2_left,zblock2_right,zblock2_places}
  },
  {
{zblock_properties,zzblock1_numbering,zzblock1,zzblock1_base,zzblock1_left,zzblock1_right,zzblock1_places},
{zblock_properties,zzblock2_numbering,zzblock2,zzblock2_base,zzblock2_left,zzblock2_right,zzblock2_places}
  },
  {
{tblock_properties,tblock1_numbering,tblock1,tblock1_base,tblock1_left,tblock1_right,tblock1_places},
{tblock_properties,tblock2_numbering,tblock2,tblock2_base,tblock2_left,tblock2_right,tblock2_places},
{tblock_properties,tblock3_numbering,tblock3,tblock3_base,tblock3_left,tblock3_right,tblock3_places},
{tblock_properties,tblock4_numbering,tblock4,tblock4_base,tblock4_left,tblock4_right,tblock4_places}
  },
    {
{iblock_properties,iblock1_numbering,iblock1,iblock1_base,iblock1_left,iblock1_right,iblock1_places},
{iblock_properties,iblock2_numbering,iblock2,iblock2_base,iblock2_left,iblock2_right,iblock2_places}
  }
};

