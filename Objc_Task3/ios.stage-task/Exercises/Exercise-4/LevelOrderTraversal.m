#import "LevelOrderTraversal.h"

int CurPos = 0;

@interface Node : NSObject

@property NSNumber *root;
@property Node *left;
@property Node *right;

- (Node *)initWithValue:(NSNumber *)value;
- (Node *)getBinaryTreeFromPreorderTraversal:(NSArray *) preorderTraversal;
- (NSMutableArray *)getLevelTraversal;

@end

@implementation Node

- (Node *)initWithValue:(NSNumber *)value {

    self = [super init];
    if (self != nil) {
        self.root = value;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}

- (Node *)getBinaryTreeFromPreorderTraversal:(NSArray *)preorderTraversal {

    if ([preorderTraversal count] <= CurPos || preorderTraversal[CurPos] == [NSNull null]) {
        return nil;
    }
    Node *root = [[Node alloc] initWithValue: preorderTraversal[CurPos]];

    CurPos += 1;
    root.left = [[Node alloc] getBinaryTreeFromPreorderTraversal: preorderTraversal];

    CurPos += 1;
    root.right = [[Node alloc] getBinaryTreeFromPreorderTraversal: preorderTraversal];

    return root;
}

- (NSMutableArray *)getLevelTraversal {

    NSMutableArray *levelTraversal = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: self.root, nil], nil];

    if (self.left != nil) {

        NSArray *left = self.left.getLevelTraversal;
        for (int i = 0; i < left.count; ++i) {
            if (i < levelTraversal.count - 1) {
                [levelTraversal[i + 1] addObjectsFromArray:left[i]];
            } else {
                [levelTraversal addObject: left[i]];
            }
        }
    }

    if (self.right != nil) {

        NSArray *right = self.right.getLevelTraversal;
        for (int i = 0; i < right.count; ++i) {
            if (i < levelTraversal.count - 1) {
                [levelTraversal[i + 1] addObjectsFromArray:right[i]];
            } else {
                [levelTraversal addObject: right[i]];
            }
        }
    }

    return levelTraversal;
}

@end



NSArray *LevelOrderTraversalForTree(NSArray *tree) {

    CurPos = 0;
    Node *binaryTree = [[Node alloc] getBinaryTreeFromPreorderTraversal:tree];

    if (binaryTree != nil) {
        return [binaryTree getLevelTraversal];
    } else {
        return @[];
    }
}
