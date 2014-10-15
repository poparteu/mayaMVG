#pragma once

#include "mayaMVG/maya/context/MVGManipulator.hpp"
#include <maya/MPointArray.h>

namespace mayaMVG
{

class MVGEditCmd;

class MVGCreateManipulator : public MVGManipulator
{
public:
    MVGCreateManipulator() {}
    virtual ~MVGCreateManipulator() {}

public:
    static void* creator();
    static MStatus initialize();

public:
    virtual void postConstructor();
    virtual void draw(M3dView&, const MDagPath&, M3dView::DisplayStyle, M3dView::DisplayStatus);
    virtual MStatus doPress(M3dView& view);
    virtual MStatus doRelease(M3dView& view);
    virtual MStatus doMove(M3dView& view, bool& refresh);
    virtual MStatus doDrag(M3dView& view);

private:
    void computeFinalWSPositions(M3dView& view);

public:
    static MTypeId _id;
    MPointArray _clickedCSPoints;
};

} // namespace