// A1: code a cat

//control of size
float size = 0.8;

//control of tail length [200,500]
float tailLength = 200;

//control of width of the shape [0-100]
float catWidth = 100;

//control of height of the shape [0-100]
float catHeight = 100;

//starting point of the cat
float centerX;
float centerY;

void setup() {
  size(800, 800);
  noLoop();
  centerX = width/2;
  centerY = height/2+100*size;

  //standardise the cat width and height
  while (catWidth > 100) {
    catWidth = catWidth - 100;
  }
  while (catHeight > 100) {
    catHeight = catHeight - 100;
  }
  catWidth = catWidth/100;
  catHeight = catHeight/100;
  tailLength = tailLength*catHeight*size;
}

void draw() {
  background(204);
  noFill();
  fill(255, 160, 220);
  float[] nosePoint = drawNose();
  noFill();
  drawMouth(nosePoint[0], nosePoint[1], 'L');
  drawMouth(nosePoint[0], nosePoint[1], 'R');
  drawEye('L');
  drawEye('R');
  fill(255, 255, 255);
  drawPaw('L');
  drawPaw('R');
  drawHead();
  drawEar('L');
  drawEar('R');
  drawBeard('L');
  drawBeard('R');
  drawBody();
  //stroke(255, 255, 255);
  drawTail();
}

void mousePressed() {
  redraw();
}

void drawTail() {
  float tailStartX = centerX;
  float tailStartY = centerY - 198*catHeight*size;
  strokeWeight(20*size);
  beginShape();
  vertex(tailStartX, tailStartY);
  float x1 = tailStartX;
  float y1 = tailStartY-40;
  float x2 = tailStartX + 320*catWidth*size;
  float x3 = tailStartX - 60*catWidth*size;
  float y2 = tailStartY - tailLength/2*catHeight*size;
  float y3 = tailStartY - tailLength*catHeight*size;
  bezierVertex(x1, y1, x2, y2, x3, y3);
  endShape();
}

void drawBody() {
  arc(centerX, centerY, 380*catWidth*size, 380*catHeight*size, radians(230), radians(310));
}

void drawBeard(char LR) {
  int Direction;
  if (LR == 'L') {
    Direction = -1;
  } else {
    Direction = 1;
  }
  float sx1 = centerX + 120*catWidth*Direction*size;
  float sy1 = centerY;
  float ex1 = centerX + 200*catWidth*Direction*size;
  float ey1 = centerY - 30*catHeight*size;

  float sx2 = centerX + 130*catWidth*Direction*size;
  float sy2 = centerY + 20*catHeight*size;
  float ex2 = centerX + 220*catWidth*Direction*size;
  float ey2 = centerY + 40*catHeight*size;

  line(sx1, sy1, ex1, ey1);
  line(sx2, sy2, ex2, ey2);
}

void drawEar(char LR) {
  int Direction;
  if (LR == 'L') {
    Direction = -1;
  } else {
    Direction = 1;
  }
  beginShape();
  float startPointX = centerX + 75*catWidth*Direction*size;
  float startPointY = centerY - 115*catHeight*size;
  vertex(startPointX, startPointY);
  float x1 = centerX + 180*catWidth*Direction*size;
  float x2 = centerX + 200*catWidth*Direction*size;
  float x3 = centerX + 160*catWidth*Direction*size;
  float y1 = centerY - 180*catHeight*size;
  float y2 = centerY - 180*catHeight*size;
  float y3 = centerY - 55*catHeight*size;
  bezierVertex(x1, y1, x2, y2, x3, y3);
  endShape();
}


void drawHead() {
  //chin
  noFill();
  arc(centerX, centerY, 350*catWidth*size, 320*catHeight*size, QUARTER_PI*1.39, QUARTER_PI*2.61);
  arc(centerX, centerY, 380*catWidth*size, 250*catHeight*size, QUARTER_PI*5.5, QUARTER_PI*6.5);
  arc(centerX, centerY+30*catHeight*size, 400*catWidth*size, 280*catHeight*size, QUARTER_PI*7.2, QUARTER_PI*8.75);
  arc(centerX, centerY+30*catHeight*size, 400*catWidth*size, 280*catHeight*size, QUARTER_PI*3.25, QUARTER_PI*4.8);
}


void drawPaw(char LR) {
  int Direction;
  if (LR == 'L') {
    Direction = -1;
  } else {
    Direction = 1;
  }
  float pawX = centerX + 120*catWidth*Direction*size;
  float pawY = centerY + 120*catHeight*size;
  //circle(pawX, pawY, 90*catWidth*catHeight*size);
  ellipse(pawX, pawY, 90*catWidth*size, 90*catHeight*size);
  line(pawX-15*catWidth*size, pawY+10*catHeight*size, pawX-15*catWidth*size, pawY+42*catHeight*size);
  line(pawX+15*catWidth*size, pawY+10*catHeight*size, pawX+15*catWidth*size, pawY+42*catHeight*size);
}

void drawEye(char LR) {
  int Direction;
  float adjustment;
  if (LR == 'L') {
    Direction = -1;
    adjustment = 9;
  } else {
    Direction = 1;
    adjustment = 0;
  }
  noFill();
  float POx = centerX + 80*catWidth*Direction*size;
  float POy = centerY;
  arc(POx, POy, 100*catWidth*size, 80*catHeight*size, QUARTER_PI*(4.5+adjustment), PI+QUARTER_PI*(2.5+adjustment));
}

void drawMouth(float noseEndX, float noseEndY, char LR) {
  int Direction;
  if (LR == 'L') {
    Direction = -1;
  } else {
    Direction = 1;
  }
  line(noseEndX, noseEndY, noseEndX, noseEndY+30*catHeight*size);
  beginShape();
  vertex(noseEndX, noseEndY+30*catHeight*size);
  float x1 = noseEndX;
  float y1 = noseEndY + 80*catHeight*size;
  float x2 = noseEndX + 60*catWidth*Direction*size;
  float y2 = noseEndY + 80*catHeight*size;
  float x3 = noseEndX + 60*catWidth*Direction*size;
  float y3 = noseEndY + 30*catHeight*size;
  bezierVertex(x1, y1, x2, y2, x3, y3);
  endShape();
}

float[] drawNose() {
  strokeWeight(3);
  beginShape();
  float[] startPoint = new float[2];
  startPoint[0] = centerX;
  startPoint[1] = centerY + 40*catHeight*size;
  vertex(startPoint[0], startPoint[1]);
  float x1 = centerX - 100*catWidth*size;
  float x2 = centerX + 100*catWidth*size;
  float x3 = centerX;
  float y1 = centerY - 20*catHeight*size;
  float y2 = centerY - 20*catHeight*size;
  float y3 = centerY + 40*catHeight*size;
  bezierVertex(x1, y1, x2, y2, x3, y3);
  endShape();
  return startPoint;
}

