% Design desired filter
fprintf('Welcome to Kent''s filter designer!\n\n');

% % Request filter style: Analog or Digital
% filter_domain = input('Filter domain? ','s');
% while ~(strcmpi(style, 'analog') || strcmpi(style, 'digital'))
%     fprintf('ERROR: %s not recognized\n', filter_domain);
%     fprintf('  - analog\n');
%     fprintf('  - digital\n');
%     filter_domain = input('Filter domain? ','s');
% end

% Request filter type: Butterworth or chebyshev
filter_style = input('Filter style? ','s');
while ~(strcmpi(filter_style, 'butterworth') || strcmpi(filter_style, 'chebyshev'))
    fprintf('ERROR: %s not recognized\n', filter_style);
    fprintf(' - butterworth\n');
    fprintf(' - chebyshev\n');
    filter_style = input('Filter style? ','s');
end

% Request filter frequency response type: Low, High, Band or Notch pass
pass_type = input('Filter pass type? ','s');
while ~(strcmpi(pass_type, 'lowpass') || strcmpi(pass_type, 'highpass')...
        || strcmpi(pass_type, 'bandpass') || strcmpi(pass_type, 'notchpass'))
    fprintf('ERROR: %s not recognized\n', pass_type);
    fprintf('  - lowpass\n');
    fprintf('  - highpass\n');
    fprintf('  - bandpass\n');
    fprintf('  - notchpass\n');
    pass_type = input('Filter pass type? ','s');
end

% Request design specification values
Gain = 0;%input('Filter gain(dB)? ');
Amax = input('Amax(dB)? ');
Amin = input('Amin(dB)? ');
if (strcmpi(pass_type, 'lowpass') || strcmpi(pass_type, 'highpass'))
    wp1 = 0;
    wp2 = input('wp(r/s)? ');
    ws1 = 0;
    ws2 = input('ws(r/s)? ');
else
    wp1 = input('wp1(r/s)? ');
    wp2 = input('wp2(r/s)? ');
    ws1 = input('ws1(r/s)? ');
    ws2 = input('ws2(r/s)? ');
end

% Design the filter with the collected info (open-ended function)
DesignFilter('analog', filter_style, pass_type, Amax, Amin, wp1, wp2, ws1, ws2);

