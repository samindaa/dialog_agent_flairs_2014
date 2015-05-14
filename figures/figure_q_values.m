close all;
load data;
figure;
axis([0 25 0.8 2.5]);

hold on;
hRandom = line ((1:21),Random);
hOptimized = line((1:21),Optimized);
hOptimal = line((1:21),Optimal);
grid minor;

set(hOptimal           , ...
  'LineWidth'       , 1, ...
  'Marker'          , 'o'    , ...
  'MarkerSize'      , 6           , ...
  'MarkerEdgeColor' , [.7 .7 .7]  , ...
  'MarkerFaceColor' , [0 0 0] , ...
  'Color'           , [.58 .58 .58]    );
set(hOptimized                  , ...
  'LineStyle'       , '--'      , ...
  'LineWidth'       , 1         , ...
  'Marker'          , 'o'    , ...
  'MarkerSize'      , 6           , ...
  'MarkerEdgeColor' , [.9 .9 .9]  , ...
  'MarkerFaceColor' , [0 1 0] , ...
  'Color'           , [.39 .7 .43]  );
set(hRandom                     , ... 
  'LineStyle'       , '-.'      , ...
  'LineWidth'       , 1         , ...
  'Marker'          , 'o'    , ...
  'MarkerSize'      , 6           , ...
  'MarkerEdgeColor' , [.9 .9 .9]  , ...
  'MarkerFaceColor' , [0 0 1] , ...
  'Color'           , [.22 .42 .6]  );

%hTitle  = title ('Q-values for three policies');
hXLabel = xlabel('Episodes'                     );
hYLabel = ylabel('Q-Value (log-scale)'                      );

% hText   = text(10, 800, ...
%   sprintf('\\it{C = %0.1g \\pm %0.1g (CI)}', ...
%   c, cint(2)-c));

hLegend = legend( ...
  [hOptimal, hOptimized, hRandom], ...
  'Optimal policy' , ...
  'Optimized policy'      , ...
  'Random policy'       , ...
  'location', [.75 .5 0 0.1] );

set( gca                       , ...
    'FontName'   , 'Helvetica' );
set([hXLabel, hYLabel], ...
    'FontName'   , 'Helvetica');
set([hLegend, gca]             , ...
    'FontSize'   , 10           );
set([hXLabel, hYLabel]  , ...
    'FontSize'   , 12          );
%set( hTitle                    , ...
%    'FontSize'   , 12          , ...
%    'FontWeight' , 'bold'      );

set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XGrid'       , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
  'YTick'       , 0:0.2:2.5, ...
  'LineWidth'   , 1         );

% p = get(hTitle,'Position');
% set(hTitle,'Position',[p(1) p(2)+0.06 p(3)]);

set(gcf, 'PaperPositionMode', 'auto');
set(gcf, 'PaperPosition', [0 0 6 5]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [6 5]); %Set the paper to
saveas(gcf, 'q-values','pdf');
