% vh debe ser columna de 3
% wh debe ser columna de 3
% q debe ser columna de 6
function [qv] = MotomanSpeed(q,serialLink, vh, wh)
    jn = serialLink.jacobn(q);
    qv = inv(jn)*[vh; wh];
end