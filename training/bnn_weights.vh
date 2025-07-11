// layer1_weights
localparam signed [7:0] layer1_weights[0:7] = '{
  '{ -1, +1, +1, +1, +1, -1, +1, +1 },
  '{ +1, -1, -1, -1, +1, -1, +1, +1 },
  '{ +1, +1, -1, +1, -1, -1, -1, +1 },
  '{ -1, -1, -1, -1, -1, -1, -1, -1 },
  '{ -1, -1, -1, +1, -1, +1, -1, -1 },
  '{ -1, +1, -1, -1, +1, +1, -1, +1 },
  '{ +1, -1, -1, -1, +1, +1, +1, +1 },
  '{ -1, -1, -1, -1, -1, -1, +1, +1 }
};
// layer2_weights
localparam signed [7:0] layer2_weights[0:7] = '{
  '{ +1, +1, +1, -1, -1, -1, -1, +1 },
  '{ +1, -1, -1, +1, -1, +1, +1, +1 },
  '{ +1, +1, +1, -1, -1, -1, -1, +1 },
  '{ +1, -1, +1, +1, -1, +1, -1, +1 },
  '{ -1, +1, -1, -1, -1, +1, -1, -1 },
  '{ +1, -1, -1, +1, +1, -1, +1, +1 },
  '{ +1, -1, -1, -1, +1, +1, +1, -1 },
  '{ -1, +1, -1, +1, +1, -1, -1, -1 }
};
// layer3_weights
localparam signed [7:0] layer3_weights[0:7] = '{
  '{ +1, +1, -1, +1, +1, +1, +1, +1 },
  '{ -1, +1, -1, -1, -1, +1, +1, +1 },
  '{ +1, +1, -1, +1, -1, +1, +1, -1 },
  '{ -1, +1, -1, -1, -1, -1, +1, -1 },
  '{ +1, +1, +1, -1, +1, +1, -1, -1 },
  '{ -1, -1, -1, +1, -1, +1, +1, +1 },
  '{ +1, -1, +1, -1, +1, +1, -1, +1 },
  '{ -1, -1, -1, +1, -1, +1, -1, -1 }
};
// output_weights
localparam real [3:0] output_weights[0:7] = '{
  '{ +0.053476, +0.453552, -0.499432, +0.513632 },
  '{ -0.555338, -0.274108, +0.394175, +0.336486 },
  '{ -0.382093, +0.414153, -0.657454, -0.372468 },
  '{ +0.620413, +0.448196, +0.328043, -0.359246 },
  '{ +0.270295, -0.216768, +0.506434, +0.355931 },
  '{ +0.358527, +0.063528, +0.483087, -0.402716 },
  '{ +0.454845, +0.086076, -0.216858, +0.336683 },
  '{ -0.366702, +0.421269, +0.400118, +0.252963 }
};
// output_biases
localparam real output_biases[0:3] = '{ 0.198904, -0.035477, -0.068345, -0.025235 };
